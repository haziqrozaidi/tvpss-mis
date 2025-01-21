package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Content;
import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.ContentService;
import com.example.tvpssmis.service.ProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/content")
public class ContentController {

    private final ContentService contentService;
    private final ProgramService programService;  

    @Autowired
    public ContentController(ContentService contentService, ProgramService programService) {
        this.contentService = contentService;
        this.programService = programService;
    }

    // View all content
    @GetMapping
    public String getAllContent(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        List<Content> contentList = contentService.getAllContent();
        model.addAttribute("contents", contentList);
        model.addAttribute("user", loggedInUser);

        return "content/content-list";
    }

    // View content details
    @GetMapping("/{content_id}/details")
    public String getContentDetails(@PathVariable int content_id, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        Optional<Content> contentOptional = contentService.getContentById(content_id);
        if (!contentOptional.isPresent()) {
            model.addAttribute("error", "Content not found.");
            return "error";
        }

        model.addAttribute("content", contentOptional.get());
        return "content/content-detail";
    }

 // Show content creation form
    @GetMapping("/create")
    public String showCreateContentForm(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        model.addAttribute("content", new Content());
        return "content/content-form"; // The JSP form where new content will be uploaded
    }

    // Save new content
    @PostMapping("/save")
    public String saveContent(@ModelAttribute Content content, @RequestParam("programId") int programId, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Fetch the Program by programId and set it to content
        Program program = programService.getProgramById(programId);  // Get Program by ID
        content.setProgram(program);  // Set the Program to the Content

        // Set the upload date for the new content (optional)
        content.setDate(new Date());

        // Save the new content
        contentService.saveContent(content);  // Save content (this will insert it into the database)

        return "redirect:/content"; // Redirect back to the content list after saving
    }

    // Delete content
    @PostMapping("/delete")
    public String deleteContent(HttpServletRequest request, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        int content_id = Integer.parseInt(request.getParameter("content_id"));
        contentService.deleteContent(content_id);

        return "redirect:/content";
    }

    // Search content by title
    @GetMapping("/search")
    public String searchContent(@RequestParam String title, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        Optional<Content> contentOptional = contentService.getContentByTitle(title);
        if (!contentOptional.isPresent()) {
            model.addAttribute("error", "No content found with the given title.");
            return "error";
        }

        model.addAttribute("content", contentOptional.get());
        return "content/content-detail";
    }

    // Show content edit form
    @GetMapping("/edit/{contentId}")
    public String editContent(@PathVariable("contentId") int contentId, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        Optional<Content> contentOptional = contentService.getContentById(contentId);
        if (!contentOptional.isPresent()) {
            model.addAttribute("error", "Content not found.");
            return "error";
        }

        model.addAttribute("content", contentOptional.get());
        return "content/content-edit"; // The JSP for the content edit form
    }

    // Handle content update
    @PostMapping("/update")
    public String updateContent(@ModelAttribute Content content, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Optionally set the upload date again if needed
        content.setDate(new Date());

        contentService.saveContent(content); // Save updated content

        return "redirect:/content"; // Redirect to content list
    }
}
