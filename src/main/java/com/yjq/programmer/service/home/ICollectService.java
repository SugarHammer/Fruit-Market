package com.yjq.programmer.service.home;

/**
 * @author admin
 *
 *
 * @create 2021-04-20 13:39
 */

import com.github.pagehelper.PageInfo;
import com.yjq.programmer.pojo.home.Collect;
import com.yjq.programmer.vo.common.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 收藏service接口
 * 
 *
 */
public interface ICollectService {

    //通过用户id查找收藏
    List<Collect> findCollectByUserId(Long userId);

    //添加收藏操作处理
    ResponseVo<Boolean> add(Long id, HttpServletRequest request);

    //删除收藏操作处理
    ResponseVo<Boolean> delete(Long id);

    //通过分页和用户id获取收藏列表
    ResponseVo<PageInfo> getCollectByPageAndUserId(Integer pageNum, Integer pageSize, Long userId);

}
