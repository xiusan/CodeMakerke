<#if packageName != ''>
package org.kjtc.${packageName}.mapper;
<#else >
package org.kjtc.mapper;
</#if>

<#if packageName != ''>
import org.kjtc.${packageName}.entity.${tabletop?cap_first}Entity;
<#else >
import org.kjtc.entity.${tabletop?cap_first}Entity;
</#if>






import org.apache.ibatis.jdbc.SQL;

<#if packageName != ''>
import org.kjtc.util.StringUtils;
<#else >
import org.kjtc.util.StringUtils;
</#if>


/**
* 类名称：${tabletop?cap_first}Provider
* 创建人：${controllerCreator}
* 创建时间：${nowDate?string("yyyy-MM-dd HH:mm:ss")}
* 描   述: ${objectRemark}
*/


public class ${tabletop?cap_first}Provider {

<#if controllerSelect != '' >
		public String get${tabletop?cap_first}List(${tabletop?cap_first}Entity ${tabletop?uncap_first}Entity){

			StringBuffer sql = new StringBuffer();

				sql.append("SELECT  ");
				<#list mysqlList as var>
					<#assign foo="${var[0]}">
					<#if  mysqlList?size-1 == var_index >
						<#assign stradd =1>
						<#assign straddac=1>
						<#assign strzhuanhu=1>
					sql.append("  ${foo}  AS <#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign straddac=straddac+1><#if straddac==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if> " );   //${var[0]}
					<#else >
						<#assign stradd =1>
						<#assign straddac=1>
						<#assign strzhuanhu=1>
                    sql.append("  ${foo}  AS <#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign straddac=straddac+1><#if straddac==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if> , " );   //${var[0]}
					</#if>
				</#list>
				sql.append("  FROM  ${tableName} ");//表名
				sql.append("   WHERE 1 = 1          ");

				<#list mysqlList as var>
					<#assign foo="${var[0]}">
					<#if var[6] == "是">

						<#assign stradd=1>
                    if (!StringUtils.isEmpty(${tabletop?uncap_first}Entity.get${var[0]?cap_first}())) {
						<#if var[7] == "=">
                        sql.append("   AND    ${var[0]}   ${var[7]}   #${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>}  ");//查询${var[1]}
						</#if>
						<#if var[7] == "like">
                        sql.append("   AND    ${var[0]}   ${var[7]}   CONCAT ('%',#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>},'%')  ");//查询${var[1]}
						</#if>
						<#if var[7] == "DATE">
                        if (!StringUtils.isEmpty(${tabletop?uncap_first}Entity.get${var[0]?cap_first}())) {
							<#assign straddstr=1>
						sql.append("   AND    ${var[0]}   <   #${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign straddstr=straddstr+1><#if straddstr==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>str}  ");//查询开始${var[1]}

                        }
						if (!StringUtils.isEmpty(${tabletop?uncap_first}Entity.get${var[0]?cap_first}())) {
							<#assign straddend=1>
                        sql.append("   AND    ${var[0]}   >   #${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign straddend=straddend+1><#if straddend==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>end}  ");//查询结束${var[1]}

                        }
						</#if>
                    };
                    </#if>
				</#list>
			return sql.toString();
		}

</#if>
<#if controllerAdd != '' >

		public String save${tabletop?cap_first}(${tabletop?cap_first}Entity ${tabletop?uncap_first}Entity){

					StringBuffer sql = new StringBuffer();
					sql.append("insert into ${tableName}");
					sql.append("(" );
				<#assign stradd=1>
				<#list mysqlList as var>
					<#assign strfrt=mysqlList?size>
					<#if strfrt==stradd >
					sql.append("${var[0]}");
					<#else>
					sql.append("${var[0]},");
					</#if>
					<#assign stradd=stradd+1>
				</#list>
					sql.append(") values ( " );
				<#assign straddas=1>
				<#list mysqlList as var>
					<#assign foo="${var[0]}">
					<#assign strfrt=mysqlList?size>
					<#assign stradd=1>
					<#if strfrt==straddas >
					sql.append("#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>}");
					<#else>
					sql.append("#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>},");
					</#if>
					<#assign straddas=straddas+1>
				</#list>
					sql.append(")" );
				return sql.toString();
		}

</#if>
<#if controllerUpadte != '' >
		public String update${tabletop?cap_first}(${tabletop?cap_first}Entity ${tabletop?uncap_first}Entity){

					StringBuffer sql = new StringBuffer();
					sql.append("update ${tableName} set ");
					<#assign stradd=1>
					<#list mysqlList as var>
						<#assign foo="${var[0]}">
						<#assign strfrt=mysqlList?size>
						<#if strfrt==stradd >
							sql.append("${var[0]}=#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>}");
						<#else>
							sql.append("${var[0]}=#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>},");
						</#if>
						<#assign stradd=stradd+1>
					</#list>
					<#assign straesd=1>
					<#list mysqlList as var>
						<#assign foo="${var[0]}">
							<#if straesd<2 >
							sql.append(" where  ${var[0]}=#${"{"}<#if foo?index_of("_")!=-1 ><#list foo?split("_") as s><#assign stradd=stradd+1><#if stradd==2 >${s?lower_case}<#else><#assign strzhuanhu=s?lower_case>${strzhuanhu?cap_first}</#if></#list><#else>${foo?lower_case}</#if>}");
							</#if>
						<#assign straesd=straesd+1>
					</#list>
				return sql.toString();
		}

</#if>
<#if controllerDelete != '' >
		public String del${tabletop?cap_first}(${tabletop?cap_first}Entity ${tabletop?uncap_first}Entity) {
					<#assign straesd=1>
					<#list mysqlList as var>
						<#if straesd<2 >
						String newSql = "  ${tableName}  where   ${var[0]} in (";
						</#if>
						<#assign straesd=straesd+1>
					</#list>
					String[] split =  ${tabletop?uncap_first}Entity.getId().split(",");
					for (int i = 0; i < split.length - 1; i++) {
					newSql += "'";
					newSql += split[i];
					newSql += "'";
					newSql += ",";
					}
					newSql += "'";
					newSql += split[split.length - 1];
					newSql += "'";
					newSql += ")";
					SQL sql = new SQL().DELETE_FROM(newSql);

			return sql.toString();
		}
</#if>
<#if controllerImport != '' >
</#if>
<#if controllerExport != '' >
</#if>
}
