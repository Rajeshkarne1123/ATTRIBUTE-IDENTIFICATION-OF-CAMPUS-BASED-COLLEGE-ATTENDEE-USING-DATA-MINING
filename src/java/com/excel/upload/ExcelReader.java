/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.excel.upload;

import com.database.Dbconnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author KishanVenky
 */

@MultipartConfig(maxFileSize=16144223)
public class ExcelReader extends HttpServlet {
    
public final String filepath="C:\\p\\";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            MultipartRequest m=new MultipartRequest(request,filepath);  
           File file=m.getFile("excel"); 
        String filename=file.getName(); 
           
        int k=0;
        
        Connection con=Dbconnection.getcon();
            Statement st=con.createStatement();
            int y=st.executeUpdate("delete from dataset");
            if(y>0){
                System.out.println("dataset deleted");
            }else{
                 System.out.println("dataset not deleted");
            }
            
            
           InputStream ins=new FileInputStream(file);
           XSSFWorkbook myWorkBook = new XSSFWorkbook(ins); 
           XSSFSheet mySheet = myWorkBook.getSheetAt(0); 
           System.out.println(mySheet.getLastRowNum());
            
           Row row;
            for(int i=1;i<=mySheet.getLastRowNum();i++){
              row=(Row)mySheet.getRow(i);
          
          String gender=null;
          String Nationality=null;
              String PlaceofBirth=null;
               String StageID=null;
              String GradeID=null;
              String SectionID=null;
                 String Topic=null;
          String Semester=null;
          String Relation=null;
          String raisedhands=null;
              String VisitedResources=null;
              
               String AnnouncementsView=null;
              String Discussion=null;
              String ParentAnsweringSurvey=null;
               String ParentschoolSatisfaction=null;
                String StudentAbsenceDays=null;
               String Class=null;
               
            if(row.getCell(0)==null){
                  gender="null";
              }else{
                   gender=row.getCell(0).toString();  
              }
            if(row.getCell(1)==null){
                  Nationality="null";
              }else{
                   Nationality=row.getCell(1).toString();  
              }
             
            
            if(row.getCell(2)==null){
                  PlaceofBirth="null";
              }else{
                  PlaceofBirth=row.getCell(2).toString();
              }
            if(row.getCell(3)==null){
                  StageID="null";
              }else{
                  StageID=row.getCell(3).toString();
              }
              if(row.getCell(4)==null){
                  GradeID="null";
              }else{
                  GradeID=row.getCell(4).toString();
              }
              if(row.getCell(5)==null){
                  SectionID="null";
              }else{
                  SectionID=row.getCell(5).toString();
              }
              if(row.getCell(6)==null){
                  Topic="null";
              }else{
                  Topic=row.getCell(6).toString();
              }
              if(row.getCell(7)==null){
                  Semester="null";
              }else{
                  Semester=row.getCell(7).toString();
              }
              if(row.getCell(8)==null){
                  Relation="null";
              }else{
                  Relation=row.getCell(8).toString();
              }
              if(row.getCell(9)==null){
                  raisedhands="null";
              }else{
                  raisedhands=row.getCell(9).toString();
              }
              if(row.getCell(10)==null){
                  VisitedResources="null";
              }else{
                  VisitedResources=row.getCell(10).toString();
              }
              if(row.getCell(11)==null){
                  AnnouncementsView="null";
              }else{
                  AnnouncementsView=row.getCell(11).toString();
              }
              if(row.getCell(12)==null){
                  Discussion="null";
              }else{
                  Discussion=row.getCell(12).toString();
              }
              if(row.getCell(13)==null){
                  ParentAnsweringSurvey="null";
              }else{
                  ParentAnsweringSurvey=row.getCell(13).toString();
              }
              if(row.getCell(14)==null){
                  ParentschoolSatisfaction="null";
              }else{
                  ParentschoolSatisfaction=row.getCell(14).toString();
              }
               if(row.getCell(15)==null){
                  StudentAbsenceDays="null";
              }else{
                  StudentAbsenceDays=row.getCell(15).toString();
              }
              
                if(row.getCell(16)==null){
                  Class="null";
              }else{
                  Class=row.getCell(16).toString();
              }
              
                
              
             
           PreparedStatement pst=con.prepareStatement("insert into dataset values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         
           pst.setString(1,gender);
            pst.setString(2,Nationality);
             pst.setString(3,PlaceofBirth);
              pst.setString(4,StageID);
            pst.setString(5,GradeID);
             pst.setString(6,SectionID);
              pst.setString(7,Topic);
              pst.setString(8,Semester);
            pst.setString(9,Relation);
             pst.setString(10,raisedhands);
              pst.setString(11,VisitedResources);
            pst.setString(12,AnnouncementsView);
             pst.setString(13,Discussion);
              pst.setString(14,ParentAnsweringSurvey);
            pst.setString(15,ParentschoolSatisfaction);
              pst.setString(16,StudentAbsenceDays);
              pst.setString(17,Class);
              
            k=pst.executeUpdate();
            
            
        }
             if(k>0){
               
               
           response.sendRedirect("Upload.jsp?msg=success");
             }else{
              
               response.sendRedirect("Upload.jsp?msg=failed");
             }
            
            
        }catch(Exception e){
          System.out.println(e);  
        }
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
