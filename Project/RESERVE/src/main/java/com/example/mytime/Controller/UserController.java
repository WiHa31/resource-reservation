package com.example.mytime.Controller;


import com.example.mytime.domain.Role;
import com.example.mytime.domain.User;
import com.example.mytime.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user") //внутри класса что бы не помечать у каждого метода мапинг
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userRepo.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) { //получаеми пользователя по userId
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values()) //получить список ролей
                .map(Role::name)
                .collect(Collectors.toSet());// перевод из enum в с string

        user.getRoles().clear();

        for (String key : form.keySet()) {  // список ключей
            if (roles.contains(key)) { // берем проверяем содержит ли ключ
                user.getRoles().add(Role.valueOf(key)); // то нашему пользователю доб эту роль
            }
        }
        userRepo.save(user);
        return "redirect:/user";
    }
}
