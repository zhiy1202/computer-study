package com.zzy.mapper;

import com.zzy.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zzy
 * @since 2023-03-03
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
