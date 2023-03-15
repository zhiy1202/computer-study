package com.zzy.controller;

import com.zzy.common.ZZYResult;
import com.zzy.service.IResourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzy
 * @since 2023-03-07
 */
@RestController
@RequestMapping("/resourceType")
public class ResourceTypeController {
    @Autowired
    private IResourceTypeService resourceTypeService;

    @GetMapping("/all")
    public ZZYResult all(){
        return ZZYResult.getInstance(200,"所有资源类型",resourceTypeService.list());
    }
}
