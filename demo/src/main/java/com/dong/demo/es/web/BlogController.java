package com.dong.demo.es.web;

import com.dong.commoncore.model.ResponseResult;
import com.dong.demo.es.dao.BlogRepository;
import com.dong.demo.es.domain.BlogModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @author liudong
 * @date 2023/5/6
 */
@RestController
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    @PostMapping("/add")
    public ResponseResult add(@RequestBody BlogModel blogModel) {
        BlogModel result = blogRepository.save(blogModel);
        return ResponseResult.success(result, "保存成功");
    }

    @GetMapping("/get/{id}")
    public ResponseResult getById(@PathVariable String id) {
        if (StringUtils.isEmpty(id))
            return ResponseResult.error("查询失败");
        Optional<BlogModel> blogModelOptional = blogRepository.findById(id);
        if (blogModelOptional.isPresent()) {
            BlogModel blogModel = blogModelOptional.get();
            return ResponseResult.success(blogModel, "查询成功");
        }
        return ResponseResult.error("查询失败");
    }

    @GetMapping("/getAll")
    public ResponseResult getAll() {
        Iterable<BlogModel> iterable = blogRepository.findAll();
        List<BlogModel> list = new ArrayList<>();
        iterable.forEach(list::add);
        return ResponseResult.success(list, "查询成功");
    }

    @PostMapping("/update")
    public ResponseResult updateById(@RequestBody BlogModel blogModel) {
        String id = blogModel.getId();
        if (StringUtils.isEmpty(id))
            return ResponseResult.error("修改失败");
        BlogModel result = blogRepository.save(blogModel);
        return ResponseResult.success(result, "修改成功");
    }

    @DeleteMapping("/delete/{id}")
    public ResponseResult deleteById(@PathVariable String id) {
        if (StringUtils.isEmpty(id))
            return ResponseResult.error("id不能为空");
        blogRepository.deleteById(id);
        return ResponseResult.success("删除成功");
    }

    @DeleteMapping("/deleteAll")
    public ResponseResult deleteAll() {
        blogRepository.deleteAll();
        return ResponseResult.success("删除成功");
    }

    @GetMapping("/search/title")
    public ResponseResult searchTitle(String keyword) {
        if (StringUtils.isEmpty(keyword))
            return ResponseResult.error("查询失败");
        return ResponseResult.success(blogRepository.findByTitleLike(keyword), "查询成功");
    }
}
