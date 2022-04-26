package com.example.demo.restController;

import com.example.demo.model.AllStudents;
import com.example.demo.model.SaveFiles;
import com.example.demo.service.AllStudentsService;
import com.example.demo.service.SaveFilesService;
import com.example.demo.viewModel.VModel;
import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import java.util.List;
import java.util.Optional;

@org.springframework.web.bind.annotation.RestController
@RequestMapping(value = "/rest")
public class RestController {

    @Autowired
    private AllStudentsService allStudentsService;

    @Autowired
    private SaveFilesService saveFilesService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)

    public String save (@RequestBody AllStudents allStudents)
    {
        allStudentsService.save(allStudents);
        return "Done";
    }
    @RequestMapping(value = "/grid",method = RequestMethod.GET)

    public List<AllStudents> grid(){

        System.out.println("hello"+allStudentsService.manualGrid());
        return allStudentsService.manualGrid();

    }
    @RequestMapping(value = "/deleteById/{id}",method = RequestMethod.POST)
    public void delete (@PathVariable Long id)
    {

        allStudentsService.manualDelete(id);

    }
    @RequestMapping(value = "/updateById/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Optional<AllStudents> loadByID(@PathVariable Long id)
    {
       return allStudentsService.loadById(id);
    }

    @RequestMapping(value = "/savefile",method = RequestMethod.POST)
    public void savefile (@RequestBody SaveFiles saveFiles){
        saveFilesService.saveFile(saveFiles);
    }

    @RequestMapping(value = "/gridFile",method = RequestMethod.GET)
    public List<SaveFiles> gridFile(){
        return saveFilesService.grid();

    }








}

