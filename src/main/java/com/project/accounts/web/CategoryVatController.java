package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.CategoryVat;
import com.project.accounts.repository.CategoryVatRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping(value = "/category")
public class CategoryVatController {

    private final CategoryVatRepository categoryVatRepository;

    public CategoryVatController(CategoryVatRepository categoryVatRepository) {
        this.categoryVatRepository = categoryVatRepository;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getForm(Model model) {
        model.addAttribute("category", new CategoryVat());
        return "categoryForm";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String create(@ModelAttribute CategoryVat categoryVat){
        categoryVatRepository.save(categoryVat);
        return "redirect:/category/add";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        Optional<CategoryVat> categoryVat = categoryVatRepository.findById(id);
        categoryVatRepository.delete(categoryVat.get());
        return "redirect:/category/all";
    }

    @GetMapping("/all")
    public String getAll(Model model){
        List<CategoryVat> categories = categoryVatRepository.findAll();
        model.addAttribute("categories", categories);
        return "categories";
    }


}
