package com.blogcode.Controller;

import com.blogcode.domain.Member;
import com.blogcode.service.MemberServiceCustom;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@NoArgsConstructor
@RestController
public class MemberController {

    MemberServiceCustom memberServiceCustom;

    @PostMapping(value = "/user/signup")
    public String userSignup(@RequestBody Member member){

        Long success = memberServiceCustom.signup(member);

        return success.toString();

    }

}