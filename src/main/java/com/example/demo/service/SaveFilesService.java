package com.example.demo.service;


import com.example.demo.model.AllStudents;
import com.example.demo.model.SaveFiles;
import com.example.demo.repository.SaveFilesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class SaveFilesService {

    @Autowired
    private SaveFilesRepo saveFilesRepo;

    public void saveFile(SaveFiles saveFiles)
    {
        saveFilesRepo.save(saveFiles);
    }

    public List<SaveFiles> grid()
    {
        List<SaveFiles> list = saveFilesRepo.findAll();
        return list;
    }
}
