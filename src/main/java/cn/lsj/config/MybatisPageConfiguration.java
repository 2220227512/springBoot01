package cn.lsj.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.github.pagehelper.PageHelper;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.Intercepter;
/**
 * 分页
 * @author lsj
 *
 */
@Configuration
public class MybatisPageConfiguration {

	/*@Bean
	public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource)throws Exception{
		SqlSessionFactoryBean sessionFactoryBean=new SqlSessionFactoryBean();
		sessionFactoryBean.setDataSource(dataSource);
		PathMatchingResourcePatternResolver resolver=new PathMatchingResourcePatternResolver();
		Interceptor[] plugins =new Interceptor[]{pageHelper()};
		sessionFactoryBean.setPlugins(plugins);
		//指定mybatisxml文件路径
		sessionFactoryBean.setMapperLocations(resolver.getResources("classpath:/mapper/*.xml"));
		return sessionFactoryBean.getObject();
	}*/
	
	
	
	@Bean
	public PageHelper pageHelper(){
		PageHelper pageHelper=new PageHelper();
		Properties p=new Properties();
		p.setProperty("offsetAsPageNum", "true");
		p.setProperty("rowBoundsWithCount", "true");
		p.setProperty("reasonable", "true");
		pageHelper.setProperties(p);
		return pageHelper;
		
	}
}
