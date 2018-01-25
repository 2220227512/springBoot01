package cn.lsj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import cn.lsj.model.User;
@Mapper
public interface UserMapper {

	public List<User> findAll();
	
	@Select("select * from user where username like '${username}%'")
	@Results({
		@Result(property="username",column="username"),
		
		
	})
	public List<User> findUserByname(@Param("username")String name);
	
	
	//like属性存入对象中，用'包裹，使用%
	@Select("select * from user where  username like '${username}%'")
	public List<User> findUserLikename3(User user);
	
	
	@Insert("insert  insert into user (username, password, name) values(#{username},#{password},#{name}) ")
	@Options(useGeneratedKeys=true,keyProperty="id",keyColumn="id") //获得插入主键
	public int insertUser(User user);

	
	
}
