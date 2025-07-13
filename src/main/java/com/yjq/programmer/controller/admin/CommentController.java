package com.yjq.programmer.controller.admin;

import com.yjq.programmer.service.common.ICommentService;
import com.yjq.programmer.vo.common.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author admin
 *
 *
 * @create 2021-04-20 23:07
 */
/**
 * 后台管理系统评论控制器
 * 
 *
 */
@RequestMapping("/admin/comment")
@Controller
public class CommentController {

    @Autowired
    private ICommentService commentService;

    /**
     * 删除评论操作处理
     * @param commentId
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(Long commentId){
        return commentService.deleteComment(commentId);
    }

}
