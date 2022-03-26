package ptithcm.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class MailController {
	
	@Autowired
	JavaMailSender mailer;
	@RequestMapping("send")
	public String sendMail(ModelMap model, @RequestParam("to") String to) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom("hmq.oketi@gmail.com", "Công ty QA");
			helper.setTo(to);
			helper.setSubject("thank to subcribe");
			helper.setText("cảm ơn bạn đã đăng ký cho chúng tôi ", true);
			mailer.send(mail);
//			model.addAttribute("mess", "Gửi mail thành công");
			
		}catch(Exception e){
			model.addAttribute("mess", "Gửi mail thất bại");
		
		}
		return "redirect:/index.htm";
	}
	
}
