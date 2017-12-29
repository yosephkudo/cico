<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Default.aspx.vb" Inherits="HRGA_OL._Default"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div runat ="server" id ="row_gs" class="row" visible ="false" >
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
               <h3 runat ="server" id="lbl_kamarkosong">0</h3>

              <p>Bed Kamar Kosong</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" runat ="server" id="lk_kamarkosong" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
               <h3 runat ="server" id="lbl_kamarisi">0</h3>

              <p>Bed Kamar Terisi</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" runat ="server" id="lk_kamarterisi" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
               <h3 runat ="server" id="lbl_event">0</h3>

              <p>Event Sedang Berlangsung</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" runat ="server" id="lk_eventberlangsung" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 runat ="server" id="lbl_ta">0</h3>
              <p>TA Belum di Assign</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="http://pama-bbso/Ticketing/Forms/Transactions/Ticketing/Frm_AssignTA.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
       </div>
    
       <div runat ="server" id ="row_pic" class="row" visible ="false" >
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
               <h3 runat ="server" id="lbl_terlaksana">0</h3>

              <p>Event Terlaksana Bulan Ini</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" runat ="server" id="lk_eventterlaksana" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3 runat ="server" id="lbl_berlangsung">0</h3>

              <p>Event Sedang Berlangsung</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" runat ="server" id="lk_eventberlangsung2" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
               <h3 runat ="server" id="lbl_kamar">0</h3>

              <p>Bed Kamar Kosong</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" runat ="server" id="lk_kamarkosong2" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 runat ="server" id="lbl_konfirm">0</h3>
              <p>Event Belum Di Konfirmasi</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="http://pama-bbso/Ticketing/Forms/Transactions/Event/Frm_RequestEvent.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
       </div>
    
     <div runat ="server" id ="row_agent" class="row" visible ="false" >
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
               <h3 runat ="server" id="lbl_emergency">0</h3>

              <p>Tiket Emergency</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
             <a href="#" runat ="server" id="lk_emergency" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
               <h3 runat ="server" id="lbl_booking">0</h3>

              <p>Tiket Sudah Di Booking</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
             <a href="#" runat ="server" id="lk_modif" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
               <h3 runat ="server" id="lbl_revisi">0</h3>

              <p>Revisi Tiket Belum Di Proses</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
             <a href="#" runat ="server" id="lk_revisi" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 runat ="server" id="lbl_issued">0</h3>
              <p>Tiket Belum Di Issued</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" runat ="server" id="lk_issued" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
       </div>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
