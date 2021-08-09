package com.example.demo.repository;

import com.example.demo.model.AllStudents;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


public interface AllStudentsRepository extends JpaRepository<AllStudents,Long> {

    @Query(value = "select e from AllStudents e ")
     List<AllStudents> manualGrid();

    @Modifying
    @Query(value = "delete from AllStudents e where e.id = ?1")
     void manualDelete(Long id);

    @Modifying
    @Query(value = "select e from AllStudents e where e.id =?1")
    Optional<AllStudents> manualLoadById(Long id);
//
//    @Modifying
//    @Query("UPDATE Note n SET n.title = ?1 WHERE n.id = ?2")
//    int updateTitleById(String title, Long id);
//
//    @Modifying
//    @Query("DELETE FROM Note n WHERE n.title = ?1")
//    void deleteByTitle(String title);
//
//    @Modifying
//    @Query("UPDATE Note n SET n.title = ?1 WHERE n.id IN ?2")
//    int bulkUpdateTitle(String title, Set<Long> id);
//
//    @Modifying
//    @Query("DELETE FROM Note n WHERE n.featured = ?1 AND n.id IN ?2")
//    void bulkDeleteByFeatured(boolean featured, Set<Long> id);

//    INSERT INTO Employee(firstName, lastName, salary)
//    @Query(value = "insert into AllStudents(id,name,family) values ("+AllStudents","+","+")")
//    public Object save(AllStudents allStudents);
}
