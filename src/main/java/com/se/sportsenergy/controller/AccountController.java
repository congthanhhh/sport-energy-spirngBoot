package com.se.sportsenergy.controller;

import com.se.sportsenergy.constant.UrlConstants;
import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.CustomUserDetails;
import com.se.sportsenergy.model.Role;
import com.se.sportsenergy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/home")
public class AccountController {

    @Autowired
    AccountService accountService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UploadImageService uploadImageService;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private RandomService randomService;

    @Autowired
    EmailService emailService;

    @GetMapping ("/register")
    public String form(Model model) {

        Account account = new Account();
        model.addAttribute("account", account);
        return "home/security/register";
    }

    @PostMapping("/register")
    public String register(Model model,Account account, @RequestParam String roleName,
                           @RequestParam MultipartFile img,
                           @RequestParam(value = "img", required = false) MultipartFile[] file,
                           @RequestParam("email")String to,@RequestParam(value = "emailCc", required = false) String[] cc, String subject, String body) {

        // Kiểm tra xem email đã tồn tại chưa
        if (accountService.isEmailExists(account.getEmail()) ) {
            model.addAttribute("registerMessage", "Email đã tồn tại, vui lòng chọn email khác!");
            return "home/security/register";
        } else if (accountService.isAccountExists(account.getUsername())) {
            model.addAttribute("registerMessage", "Username đã tồn tại, vui lòng chọn username khác!");
            return "home/security/register";
        } else {

            account.setPhoto(img != null ? img.getOriginalFilename() : null);

            Role role = roleService.findById(roleName);
            accountService.create(account,role);

            // Tạo một đối tượng mới của ImageService và gọi phương thức saveImage

            if (img != null) {
                String uploadPath = "src/main/resources/static/img/user";
                uploadImageService.saveImage(img, uploadPath);
            }

            subject = "Energy's Sprot";

            body = "<h2>Wellcome bạn đã tạo tài khoản thành công tại Energy's Sport</h3> <br> <a href=\"" + UrlConstants.LOGIN_URL + "\">login now</a>";

            emailService.sendMail(file, to, cc, subject, body);
            System.out.println("Send mail successfully");
            model.addAttribute("registerMessage", "Đăng ký tài khoản thành công!");

            return "home/security/register";

        }
    }

    @RequestMapping("from-forgotPass")
    public String formForgot() {
        return "home/security/forgot-pass";
    }

    @RequestMapping("/forgot-password")
    public String forgotPassword(@RequestParam(value = "img", required = false) MultipartFile[] file,
                                 @RequestParam("email") String email, Model model,
                                 @RequestParam(value = "emailCc", required = false) String[] cc
                                 ) {
        // Kiểm tra xem email có tồn tại hay không
        Account account = accountService.findByEmail(email);
        if (account == null) {
            model.addAttribute("forgotPasswordMessage", "Email not found!");
            return "home/security/forgot-pass";
        }

        // Tạo mật khẩu mới
        String newPassword = randomService.randomAlphaNumeric(8);
        // Cập nhật mật khẩu trong cơ sở dữ liệu
        accountService.updatePassword(account, newPassword);

        // Gửi mật khẩu mới đến email
        String subject = "Forgot Password";
        String body = "Your new password is: " + newPassword + " <h4>Click here to</h3> <br> <a href=\"" + UrlConstants.CHANGE_PASS_URL + "\">Change pass</a>";
        emailService.sendMail(null, email, cc, subject, body);

        model.addAttribute("forgotPasswordMessage", "New password sent to your email!");
        return "home/security/forgot-pass";
    }

    @RequestMapping("/change-pass-form")
    public String changePass(Model model) {

        return "home/security/change-pass";
    }

    @RequestMapping("/change-pass")
    public String changePass(@RequestParam("newPass") String newPass, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // Lấy CustomUserDetails từ đối tượng Authentication
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        // Lấy username từ CustomUserDetails
        String username = userDetails.getUsername();
        Account account = accountService.findById(username);

        if (account != null) {
            accountService.updatePassword(account, newPass);
            model.addAttribute("updatePasswordMessage", "Change pass successfully");
        } else {
            model.addAttribute("updatePasswordMessage", "Change pass failed");
        }

        return "home/security/change-pass";
    }




    @ModelAttribute("roles")
    public List<Role> getRoles() {
        return roleService.findAll();
    }


@GetMapping ("/myinfor/{username}")
public String myinfor(Model model, @PathVariable("username") String username) {
   
    model.addAttribute("account", accountService.findById(username));
        return "home/infor/myinfor"; 
   
}

@GetMapping ("/editmyinfor/{username}")
public String editmyinfor(Model model, @PathVariable("username") String username) {
   
    model.addAttribute("account", accountService.findById(username));
        return "home/infor/edit_myinfor"; 
   
}
        
@PostMapping("/myinfor/edit/{username}")
	public String editSubmit(Model model, @PathVariable String username,
			@ModelAttribute("account") Account account, 
			@RequestParam("img") MultipartFile img) {
		Account existingAccount = accountService.findById(username);
		existingAccount.setPassword(account.getPassword());
		existingAccount.setAddress(account.getAddress());
        existingAccount.setPhone(account.getPhone());
		existingAccount.setFullname(account.getFullname());
		/* existingAccount.setEmail(account.getEmail()); */
		System.out.println(img);
		existingAccount.setPhoto(img != null ? img.getOriginalFilename() : null);

		

		if (img != null) {
			String uploadPath = "src/main/resources/static/img/user";
			uploadImageService.saveImage(img, uploadPath);
		}
		
        
        accountService.updateAccount(existingAccount);
			return "redirect:/home/myinfor/{username}";
		

			 
		

		

}

}
