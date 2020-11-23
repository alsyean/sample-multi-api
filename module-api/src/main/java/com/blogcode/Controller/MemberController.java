package com.blogcode.Controller;

import com.blogcode.domain.Member;
import com.blogcode.service.MemberServiceCustom;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@NoArgsConstructor
@RestController
public class MemberController {

    MemberServiceCustom memberServiceCustom;

    @PostMapping(value = "/user/signup")
    public String userSignup(@RequestBody Member member){

        Long success = memberServiceCustom.signup(member);

        return success.toString();

    }
    
     @GetMapping(value = "/")
    public String index() {
        InetAddress local;
        String ip = "";
        try {
            local = InetAddress.getLocalHost();
            ip = local.getHostAddress();
            System.out.println("local ip : " + ip);
        } catch (UnknownHostException e1) {
            e1.printStackTrace();
        }

        return "index" + ip ;
    }

}
