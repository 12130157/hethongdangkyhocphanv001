package system.bo;

import java.util.ArrayList;
import system.access.mapper.clsMapperRegistration;
import system.dto.clsClass;
import system.dto.clsRegistration;

/**
 *
 * @author ngloc_it
 */
public class clsBORegistration {
    /**
      *
      * @param className
      * @return
      * @throws Exception
      */
     public ArrayList<String> getListStudentIdFromClassName(String className) throws Exception{
        try{
            clsMapperRegistration mapper = new clsMapperRegistration();
            return mapper.getListStudentIdFromClassName(className);
        }catch(Exception ex){
            throw ex;
        }
     }

     /**
      * Delte all registraion of student by id
      * @param mssv id of student
      * @throws Exception
      */
     public void Delete(String mssv) throws Exception{
         try{
             clsMapperRegistration mapper = new clsMapperRegistration();
             mapper.RegistrationDeleteByStudentId(mssv);
         }catch(Exception ex){
             throw ex;
         }
     }
     public void insert(clsRegistration cls) throws Exception{
         clsMapperRegistration mpr=new clsMapperRegistration();
         mpr.RegistrationInsert(cls);
     }
     public void deleteAll(String MSSV, int semester, String year) throws Exception{
         clsMapperRegistration mpr=new clsMapperRegistration();
         mpr.DeleteAllRegistry(MSSV, semester, year);
     }
     public ArrayList<String> getRegistrationInfo(clsRegistration cls) throws Exception{
         clsMapperRegistration mpr=new clsMapperRegistration();
         return mpr.getRegistrationInfo(cls);
     }
}