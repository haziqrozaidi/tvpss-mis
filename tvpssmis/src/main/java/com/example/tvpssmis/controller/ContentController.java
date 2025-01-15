package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Content;
import com.example.tvpssmis.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ContentController {

    @Autowired
    private ContentService contentService;

    @GetMapping("/content/manage")
    public String manageContent(Model model) {
        List<Content> contentList = contentService.getAllContent();
        model.addAttribute("contentList", contentList);
        return "ManageContent"; // This should match the name of the JSP file
    }

    @GetMapping("/content/update")
    public ModelAndView showUpdateForm(@RequestParam("id") Long id) {
        Content content = contentService.getContentById(id);
        ModelAndView modelAndView = new ModelAndView("UpdateContentInformation");
        modelAndView.addObject("content", content);
        return modelAndView;
    }

    @PostMapping("/content/update")
    public String updateContent(@RequestParam("id") Long id,
                                 @RequestParam("title") String title,
                                 @RequestParam("description") String description,
                                 @RequestParam("category") String category,
                                 @RequestParam("type") String type) {
        Content content = contentService.getContentById(id);
        if (content != null) {
            content.setTitle(title);
            content.setDescription(description);
            content.setCategory(category);
            content.setStatus("Active"); // Assuming status remains active
            contentService.saveContent(content);
        }
        return "redirect:/content/manage"; // Redirect to manage content page
    }

    @PostMapping("/content/delete")
    public String deleteContent(@RequestParam("id") Long id) {
        contentService.deleteContent(id);
        return "redirect:/content/manage"; // Redirect to manage content page
    }
}
