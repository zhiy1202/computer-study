package com.zzy.controller;

import cn.hutool.core.lang.ObjectId;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zzy.common.ZZYResult;
import com.zzy.entity.Resource;
import com.zzy.service.IResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zzy
 * @since 2023-03-07
 */
@Slf4j
@RestController
@RequestMapping("/resource")
public class ResourceController {

    @Value("${zzy.local}")
    private String address;

    @Value("${zzy.filePath}")
    private String filePath;

    @Autowired
    private IResourceService resourceService;

    //上传文件
    @Transactional
    @PostMapping("/add")
    public ZZYResult<Boolean> addLove(MultipartFile file, Resource resource) {
        File files = new File(filePath);
        String filename = file.getOriginalFilename();
        String[] split = filename.split("\\.");
        String fix = split[split.length - 1];
        String pre = ObjectId.next();
        String disk = filePath + pre + "." + fix;
        log.info("存储地址:" + disk);
        try {
            if (!files.exists()) {
                files.mkdirs();
            }
            file.transferTo(new File(disk));
        } catch (IOException e) {
            log.info("文件存储失败");
        }
        String add = address + pre + "." + fix;
        log.info(add);
        resource.setRemotePath(add);
        resourceService.save(resource);

        return ZZYResult.getInstance(200, "存储成功", true);
    }

    //分类获取所有文件
    @GetMapping("/queryType/{id}")
    public ZZYResult queryType(@PathVariable("id") Integer id) {
        QueryWrapper<Resource> wrapper = new QueryWrapper<>();
        wrapper.eq("type", id);
        return ZZYResult.getInstance(200, "分类资源", resourceService.list(wrapper));
    }

    //删除文件
    @DeleteMapping("/del/{id}")
    public ZZYResult del(@PathVariable("id") Integer id) {
        boolean b = resourceService.removeById(id);
        return ZZYResult.getInstance(200, "删除资源", b);
    }

}
