package com.example.demo.service;


import com.example.demo.model.AllStudents;
import com.example.demo.repository.AllStudentsRepository;
import com.example.demo.viewModel.VModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AllStudentsService {

    @Autowired
    private AllStudentsRepository repo;

    public String save(AllStudents allStudents)
    {

        repo.save(allStudents);

        return "done";
    }

    public List<AllStudents> grid()
    {
        List<AllStudents> list = repo.findAll();
        return list;
    }

    public List<AllStudents> manualGrid()
    {
        List<AllStudents> list = repo.manualGrid();
        return list;
    }

    public void  manualDelete(Long id)
    {

        repo.manualDelete(id);

    }

    public void delete(Long id)
    {

        repo.deleteById(id);

    }

    public Optional<AllStudents> loadById(Long id)
    {
        return repo.findById(id);
    }

    public Optional<AllStudents> manualloadById(Long id)
    {
        return repo.manualLoadById(id);
    }

}
