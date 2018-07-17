package com.example.mytime.repos;

import com.example.mytime.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    List<Message> findByPlacement(String placement);

}
