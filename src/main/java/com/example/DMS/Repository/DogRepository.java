package com.example.DMS.Repository;
import java.util.List;

/* 
@Author Tirumala Arikatla - S72776
*/

import org.springframework.data.repository.CrudRepository;

import com.example.DMS.Models.Dog;

public interface DogRepository extends CrudRepository<Dog,Integer> {
	List<Dog> findByName(String name);

}
