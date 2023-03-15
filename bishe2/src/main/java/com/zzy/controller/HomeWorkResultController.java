package com.zzy.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zzy.common.CommonEntity;
import com.zzy.common.ZZYResult;
import com.zzy.entity.HomeWorkDetail;
import com.zzy.entity.HomeWorkResult;
import com.zzy.entity.Homework;
import com.zzy.entity.User;
import com.zzy.service.IHomeWorkDetailService;
import com.zzy.service.IHomeWorkResultService;
import com.zzy.service.IHomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzy
 * @since 2023-03-03
 */
@RestController
@RequestMapping("/result")
public class HomeWorkResultController {

    @Autowired
    private IHomeWorkResultService homeWorkResultService;

    @Autowired
    private IHomeworkService homeworkService;

    @Autowired
    private IHomeWorkDetailService homeWorkDetailService;

    //学生答题
    @PostMapping("/add/{homeworkId}/{resultId}")
    public ZZYResult add(@PathVariable("homeworkId") Integer homeworkId ,
                         @PathVariable("resultId") Integer resultId,
                         HomeWorkResult homeWorkResult){

        return ZZYResult.getInstance(200,"学生答题",true);
    }

    //老师阅卷

    //查看错题
    @GetMapping("/error")
    public ZZYResult studentError(HttpServletRequest request){
        List<CommonEntity> entities = new ArrayList<>();
        User studentInfo = (User) request.getSession().getAttribute("studentInfo");
        QueryWrapper<HomeWorkResult> wrapper = new QueryWrapper<>();
        wrapper.eq("is_true",false);
        wrapper.eq("user_id",studentInfo.getId());
        List<HomeWorkResult> list = homeWorkResultService.list(wrapper);
        for (HomeWorkResult homeWorkResult : list) {
            Homework homework = homeworkService.getById(homeWorkResult.getHomeworkId());
            HomeWorkDetail homeWorkDetail = homeWorkDetailService.getById(homeWorkResult.getHomeworkDetailId());
            CommonEntity entity = new CommonEntity();
            entity.setP1(homework);
            entity.setP2(homeWorkDetail);
            entity.setP3(homeWorkResult);
            entity.setP4(studentInfo);
            entities.add(entity);
        }
        return ZZYResult.getInstance(200,"所有错题",entities);
    }
    //删除
    @DeleteMapping("/del/{id}")
    public ZZYResult del(@PathVariable("id") Integer id){
        boolean b = homeWorkResultService.removeById(id);
        return ZZYResult.getInstance(200,"删除错题",b);
    }

}
