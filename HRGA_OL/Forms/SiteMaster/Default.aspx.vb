

Public Class _Default
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("GPID") = "GS ADMIN" Or Session("GPID") = "ADMINISTRATOR" Then
                row_gs.Visible = True
                Dash_GS(lbl_ta.InnerText, lbl_event.InnerText, lbl_kamarisi.InnerText, lbl_kamarkosong.InnerText)
            Else
                row_gs.Visible = False
            End If

            If Session("GPID") = "PIC TRAINING" Or Session("GPID") = "ADMINISTRATOR" Then
                row_pic.Visible = True
                Dash_PIC(lbl_konfirm.InnerText, lbl_terlaksana.InnerText, lbl_berlangsung.InnerText, lbl_kamar.InnerText)
            Else
                row_pic.Visible = False
            End If

            If Session("GPID") = "AGENT TICKETING VAYA" Or Session("GPID") = "AGENT TICKETING LINTAS" Or Session("GPID") = "ADMINISTRATOR" Then
                row_agent.Visible = True
                Dash_Agent(lbl_booking.InnerText, lbl_issued.InnerText, lbl_emergency.InnerText, lbl_revisi.InnerText, Session("Agent"))
            Else
                row_agent.Visible = False
            End If
        Catch ex As Exception

        End Try
      
    End Sub

    

    Public Sub Dash_PIC(ByRef s_str_konfirm As String, ByRef s_str_terlaksana As String, ByRef s_str_berlangsung As String, ByRef s_str_kamar As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM Vw_Dashboard_PIC_Training"
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_konfirm = dr.Item("BELUM_KONFIRM").ToString
                s_str_terlaksana = dr.Item("TERLAKSANA").ToString
                s_str_berlangsung = dr.Item("BERLANGSUNG").ToString
                s_str_kamar = dr.Item("KAMAR_KOSONG").ToString
            Else
                s_str_konfirm = "0"
                s_str_terlaksana = "0"
                s_str_berlangsung = "0"
                s_str_kamar = "0"
            End If
            con.Close()
        End With
    End Sub

    Public Sub Dash_GS(ByRef s_str_ta As String, ByRef s_str_berlangsung As String, ByRef s_str_terisi As String, ByRef s_str_kosong As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM Vw_Dashboard_GS_Admin"
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_ta = dr.Item("TA").ToString
                s_str_berlangsung = dr.Item("BERLANGSUNG").ToString
                s_str_terisi = dr.Item("KAMAR_TERISI").ToString
                s_str_kosong = dr.Item("KAMAR_KOSONG").ToString
            Else
                s_str_ta = "0"
                s_str_berlangsung = "0"
                s_str_terisi = "0"
                s_str_kosong = "0"
            End If
            con.Close()
        End With
    End Sub

    Public Sub Dash_Agent(ByRef s_str_booking As String, ByRef s_str_issued As String, ByRef s_str_emergency As String, ByRef s_str_revisi As String, ByVal s_int_agent As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM Vw_Dashboard_Agent Where KodeSupplier=@AGENT"
            .Parameters.Add("@AGENT", SqlDbType.Int).Value = s_int_agent
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_booking = dr.Item("BOOKING").ToString
                s_str_issued = dr.Item("BELUM_ISSUED").ToString
                s_str_emergency = dr.Item("EMERGENCY").ToString
                s_str_revisi = dr.Item("REVISI").ToString
            Else
                s_str_booking = "0"
                s_str_issued = "0"
                s_str_emergency = "0"
                s_str_revisi = "0"
            End If
            con.Close()
        End With
    End Sub
  
    Private Sub lk_kamarkosong_ServerClick(sender As Object, e As EventArgs) Handles lk_kamarkosong.ServerClick, lk_kamarkosong2.ServerClick, lk_kamarterisi.ServerClick
        Session("Path") = "/Bostrent/StatusKamarPBR"
        Response.Redirect(url & "/Forms/Reports/Frm_DashReport.aspx")
    End Sub

    Private Sub lk_eventberlangsung_ServerClick(sender As Object, e As EventArgs) Handles lk_eventberlangsung.ServerClick, lk_eventberlangsung2.ServerClick, lk_eventterlaksana.ServerClick
        Session("Path") = "/BOSTRENT/Rpt_AktualEvent"
        Response.Redirect(url & "/Forms/Reports/Frm_DashReport.aspx")
    End Sub

    Private Sub lk_emergency_ServerClick(sender As Object, e As EventArgs) Handles lk_emergency.ServerClick
        Response.Redirect(url & "/Forms/Transactions/Ticketing/Frm_TicketEmergency.aspx")
    End Sub

    Private Sub lk_modif_ServerClick(sender As Object, e As EventArgs) Handles lk_modif.ServerClick
        Response.Redirect(url & "/Forms/Transactions/Ticketing/Frm_ModifBooking.aspx")
    End Sub

    Private Sub lk_issued_ServerClick(sender As Object, e As EventArgs) Handles lk_issued.ServerClick
        Response.Redirect(url & "/Forms/Transactions/Ticketing/Frm_IssuedTicket.aspx")
    End Sub

    Private Sub lk_revisi_ServerClick(sender As Object, e As EventArgs) Handles lk_revisi.ServerClick
        Response.Redirect(url & "/Forms/Transactions/Ticketing/Frm_RevisiTicket.aspx")
    End Sub
End Class