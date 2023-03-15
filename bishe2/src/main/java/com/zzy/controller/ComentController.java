package com.zzy.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zzy.common.CommonEntity;
import com.zzy.common.ZZYResult;
import com.zzy.entity.Coment;
import com.zzy.entity.ComentRelation;
import com.zzy.entity.User;
import com.zzy.service.IComentRelationService;
import com.zzy.service.IComentService;
import com.zzy.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zzy
 * @since 2023-03-07
 */
@RestController
@RequestMapping("/coment")
public class ComentController {

    @Autowired
    private IComentService comentService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IComentRelationService comentRelationService;

    //发送评论
    @Transactional
    @PostMapping("/add")
    public ZZYResult add(Coment coment, String teacherName, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        //当前发送对象
        coment.setSendId(user.getId());
        User username = userService.getOne(new QueryWrapper<User>().eq("username", teacherName));
        if (username == null) {
            return ZZYResult.getInstance(401, "没有该老师", false);
        } else {
            Integer id = username.getId();
            ComentRelation comentRelation = new ComentRelation();
            comentRelation.setUserOne(user.getId());
            comentRelation.setUserTwo(id);
            boolean save1 = comentRelationService.save(comentRelation);
            //接收者id
            if (save1) {
                coment.setComentRelationId(comentRelation.getId());
            }
            coment.setGetId(id);
            boolean save = comentService.save(coment);
            return ZZYResult.getInstance(200, "发送成功", save);
        }
    }

    //通过用户id获取所有评论
    @GetMapping("/all")
    public ZZYResult all(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();
        QueryWrapper<Coment> wrapper = new QueryWrapper<>();
        wrapper.eq("get_id", id);
        List<Coment> list = comentService.list(wrapper);
        return ZZYResult.getInstance(200, "所有评论", list);
    }

    //回复
    @PostMapping("/back")
    public ZZYResult back(Coment coment, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();
        coment.setSendId(id);
        boolean save = comentService.save(coment);
        return ZZYResult.getInstance(200, "回复成功", save);
    }

    //获取用户所有评论
    @GetMapping("/allComent")
    public ZZYResult allComent(HttpServletRequest request) {
        List<CommonEntity> entities = new ArrayList<>();
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();
        QueryWrapper<ComentRelation> wrapper = new QueryWrapper<>();
        wrapper.eq("user_one", id).or().eq("user_two", id);
        List<ComentRelation> list = comentRelationService.list(wrapper);
        for (ComentRelation comentRelation : list) {
            Integer id1 = comentRelation.getId();
            List<Coment> comentList = comentService.list(new QueryWrapper<Coment>().eq("coment_relation_id", id1));
            Coment coment = comentList.get(0);
            User byId = userService.getById(coment.getSendId());
            CommonEntity entity = new CommonEntity();
            entity.setP1(comentRelation);
            entity.setP2(comentList);
            entity.setP3(byId);
            entities.add(entity);
        }
        return ZZYResult.getInstance(200,"获取所有发言",entities);
    }
    @GetMapping("/allComent2")
    public ZZYResult allComent2(HttpServletRequest request) {
        List<CommonEntity> entities = new ArrayList<>();
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();
        QueryWrapper<ComentRelation> wrapper = new QueryWrapper<>();
        wrapper.eq("user_one", id).or().eq("user_two", id);
        List<ComentRelation> list = comentRelationService.list(wrapper);
        for (ComentRelation comentRelation : list) {
            Integer id1 = comentRelation.getId();
            List<Coment> comentList = comentService.list(new QueryWrapper<Coment>().eq("coment_relation_id", id1));
            Coment coment = comentList.get(0);
            User byId = userService.getById(coment.getGetId());
            CommonEntity entity = new CommonEntity();
            entity.setP1(comentRelation);
            entity.setP2(comentList);
            entity.setP3(byId);
            entities.add(entity);
        }
        return ZZYResult.getInstance(200,"获取所有发言",entities);
    }

}
