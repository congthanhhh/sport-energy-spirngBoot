package com.se.sportsenergy.controller.admin;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Authority;
import com.se.sportsenergy.model.Role;
import com.se.sportsenergy.service.AccountService;
import com.se.sportsenergy.service.AuthorityService;
import com.se.sportsenergy.service.EmailService;
import com.se.sportsenergy.service.RoleService;
import com.se.sportsenergy.service.UploadImageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AccountAdminController {

	@Autowired
	AccountService accountService;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	RoleService roleService;

	@Autowired
	EmailService emailService;

	@Autowired
	private UploadImageService uploadImageService;

	@GetMapping("/accounts")
	public String listAccounts(Model model, Authentication authentication) {
		List<Account> accounts;
		String role = null;

		for (GrantedAuthority authority : authentication.getAuthorities()) {
			role = authority.getAuthority();
			break; // Lấy quyền đầu tiên trong danh sách
		}

		if ("STAF".equals(role)) {
			accounts = accountService.findStaffAccounts();
		} else if ("DIRE".equals(role)) {
			accounts = accountService.findAll();
		} else {
			accounts = accountService.findAll();
		}

		model.addAttribute("accounts", accounts);
		return "admin/table/account";
	}

	@GetMapping("/accounts/createform")
	public String showCreateAccountForm(Model model) {
		List<Role> list = roleService.findAll();
		model.addAttribute("roles", list);
		model.addAttribute("account", new Account());
		// model.addAttribute("registrerMessage", list)
		return "admin/form/add_account"; // Điều hướng đến trang tạo tài khoản
	}

	@PostMapping("/accounts/createAccount")
	public String createAccount(Model model, Account account, @RequestParam String roleName,
			@RequestParam MultipartFile img, @RequestParam(value = "img", required = false) MultipartFile[] file,
			@RequestParam("email") String to, @RequestParam(value = "email", required = false) String[] cc,
			String subject, String body, RedirectAttributes redirectattribute) {

		if (accountService.findById(account.getUsername()) != null) {
			redirectattribute.addFlashAttribute("registrerMessage",
					"Username đã tồn tại, vui lòng chọn username khác!");
			return "redirect:/admin/accounts/createform";
		}

		// Kiểm tra xem email đã tồn tại chưa
		if (accountService.isEmailExists(account.getEmail())) {
			redirectattribute.addFlashAttribute("registrerMessage", "Email đã tồn tại, vui lòng chọn email khác!");
			return "redirect:/admin/accounts/createform";
		}
		account.setPhoto(img != null ? img.getOriginalFilename() : null);

		Role role = roleService.findById(roleName);
		accountService.create(account, role);

		// Tạo một đối tượng mới của ImageService và gọi phương thức saveImage

		if (img != null) {
			String uploadPath = "src/main/resources/static/img/user";
			uploadImageService.saveImage(img, uploadPath);
		}

		subject = "Energy's Sprot";
		body = "<h2>Wellcome bạn đã tạo tài khoản thành công tại Energy's Sport</h3> <br> <a href=\"http://localhost:8080/security/login/form\">login now</a>";
		emailService.sendMail(file, to, cc, subject, body);
		model.addAttribute("registerMessage", "Register successfully!");

		System.out.println("thêm thành công");

		return "redirect:/admin/accounts"; // Điều hướng sau khi tạo tài khoản thành công
	}

	@GetMapping("/accounts/editForm/{username}")
	public String showEditForm(Model model, @PathVariable("username") String username) {
		List<Role> list = roleService.findAll();
		model.addAttribute("roles", list);
		model.addAttribute("account", accountService.findById(username));
		return "admin/form/edit_account"; // Điều hướng đến trang tạo tài khoản
	}

	@PostMapping("/accounts/edit/{username}")
	public String editAccountSubmit(Model model, @PathVariable String username,
			@ModelAttribute("account") Account account, @RequestParam("roleName") String roleName,
			@RequestParam("img") MultipartFile img) {
		Account existingAccount = accountService.findById(username);
		existingAccount.setPassword(account.getPassword());
		existingAccount.setPhone(account.getPhone());
		existingAccount.setAddress(account.getAddress());
		existingAccount.setFullname(account.getFullname());
		/* existingAccount.setEmail(account.getEmail()); */
		System.out.println(img);
		existingAccount.setPhoto(img != null ? img.getOriginalFilename() : null);

		Role role = roleService.findById(roleName);

		if (img != null) {
			// String uploadPath = "E:/cloneGithub/cloneGit/SE/upload";
			String uploadPath = "src/main/resources/static/img/user";
			uploadImageService.saveImage(img, uploadPath);
		}
		if (existingAccount != null) {
			accountService.updateAccountWithRole(existingAccount, role);

			return "redirect:/admin/accounts";
		}

		model.addAttribute("error", "Tài khoản không tồn tại.");
		return "redirect:/admin/accounts/editForm" + existingAccount.getUsername();

	}

	@GetMapping("/accounts/delete/{username}")
	public String deleteAccount(@PathVariable String username) {
		accountService.delete(username);
		return "redirect:/admin/accounts";

	}

	@GetMapping("/accounts/backup/{username}")
	public String backupAccount(@PathVariable String username) {
		accountService.backup(username);
		return "redirect:/admin/accounts";

	}

}
