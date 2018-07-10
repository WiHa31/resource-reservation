package com.example.mytime.Controller;

import com.example.mytime.domain.Message;
import com.example.mytime.domain.User;
import com.example.mytime.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(String name, Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user, @RequestParam String text,
                      @RequestParam String placement,
                      @RequestParam Integer num_us,
                      @RequestParam Integer start,
                      @RequestParam Integer stop,
                      @RequestParam String date,
                      Map<String, Object> model) {

        Date date_d = reformatDate(date);
        Message message = new Message(text, placement, num_us, start, stop, date_d, user);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

    private Date reformatDate(String date){
        DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        Date date_o = null;
        try {
            date_o = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date_o;
    }
}
