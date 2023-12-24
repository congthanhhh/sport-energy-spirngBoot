package com.se.sportsenergy.momo;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.service.OrderService;

@Service
public class MomoService {
	@Autowired
    private Environment env;
	
	@Autowired
	OrderService service;
	
	@Autowired
    private RestTemplate restTemplate;
	
	public MomoResponse createMomoPayment(Order order) 
			throws NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
        
		String endPoint = env.getProperty("payment.momo.endpoint");
        String ipnUrl = env.getProperty("payment.momo.ipnUrl");
        
        
        String partnerCode = env.getProperty("payment.momo.partner-code");
        String accessKey = env.getProperty("payment.momo.access-key");
        String secretKey = env.getProperty("payment.momo.secret-key");
        
        String requestType = "captureWallet";
        
        String redirectUrl = "http://localhost:8080/orders/momo-result";
        
        String orderInfo = "Khách hàng: " + order.getAccount().getFullname() + " thanh toán";
        List<OrderDetail> list = order.getOrderDetails();
        double sum = 0;
        for(OrderDetail dd : list) {
        	sum+=dd.getQuantity() * dd.getPrice();
        }
        System.out.println(sum);
        String amount = String.valueOf(sum).substring(0, String.valueOf(sum).length() - 2); 
        String orderId = order.getId().toString() + java.util.UUID.randomUUID().toString();
        String requestId = java.util.UUID.randomUUID().toString();
        String extraData = "";
        
        List<MomoItem> items = 
        		order.getOrderDetails().stream()
        		.map(
        				x -> new MomoItem(String.valueOf(x.getProduct().getId()), x.getProduct().getName())
        		)
        		.toList();

        String rawHash = "accessKey=" + accessKey +
                "&amount=" + amount +
                "&extraData=" + extraData +
                "&ipnUrl=" + ipnUrl +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&partnerCode=" + partnerCode +
                "&redirectUrl=" + redirectUrl +
                "&requestId=" + requestId +
                "&requestType=" + requestType;

        MomoSecurity crypto = new MomoSecurity();
        // Sign signature SHA256
        String signature = crypto.signSHA256(rawHash, secretKey);

        MomoRequest momoMessage = new MomoRequest();
        momoMessage.setPartnerCode(partnerCode);
        momoMessage.setPartnerName("MinieShop");
        momoMessage.setStoreId("MinieShop");
        momoMessage.setRequestId(requestId);
        momoMessage.setAmount(amount);
        momoMessage.setOrderId(orderId);
        momoMessage.setOrderInfo(orderInfo);
        momoMessage.setRedirectUrl(redirectUrl);
        momoMessage.setIpnUrl(ipnUrl);
        momoMessage.setLang("vi");
        momoMessage.setExtraData(extraData);
        momoMessage.setRequestType(requestType);
        momoMessage.setItems(items);
        momoMessage.setSignature(signature);

        String result = restTemplate.postForObject(endPoint, 
        		momoMessage, String.class);

        ObjectMapper objectMapper = new ObjectMapper();
        
        System.out.println(result);

        return objectMapper.readValue(result, MomoResponse.class);
    }
}
