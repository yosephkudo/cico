Imports System.Data.SqlClient

Public Class Frm_ModifBooking
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            CekAkses(Session("GPID"))
        Catch ex As Exception
            Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
        End Try
    End Sub

    Public Sub CekAkses(ByVal s_str_gp As String)

        'path = path.Replace("/Ticketing", "")
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
            .CommandText = "SELECT [LinkMenu] FROM [Vw_Menu] WHERE Deskripsi=@Deskripsi and LinkAkses=@Link"
            .Parameters.Add("@Deskripsi", SqlDbType.VarChar, 50).Value = s_str_gp
            .Parameters.Add("@Link", SqlDbType.VarChar, 500).Value = path
            dr = .ExecuteReader
            If dr.Read = False Then
                ' ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('" & path & "');", True)
                Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
            End If
            con.Close()
        End With

    End Sub
    Sub carikoma(ByRef s_str_data As String)
        Try
            If s_str_data = "" Then
                s_str_data = "0"
            End If
            Dim array() As String
            array = s_str_data.Split(",")
            s_str_data = array(0).ToString + "." + array(1).ToString
        Catch ex As Exception
            s_str_data = s_str_data
        End Try
    End Sub
    Sub carititik(ByRef s_str_data As String)
        Try
            If s_str_data = "" Then
                s_str_data = "0"
            End If
            Dim array() As String
            array = s_str_data.Split(".")
            s_str_data = array(0).ToString + "" + array(1).ToString
        Catch ex As Exception
            s_str_data = s_str_data
        End Try
    End Sub

    Protected Sub gv_listBooking_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Dim KodeBooking As String = gv_listBooking.DataKeys(e.NewSelectedIndex).Value
            Get_Booking(KodeBooking, lbl_maskapai.Text, lbl_Maskapaidesc.Text, lbl_servicefee.Text, lbl_NTA.Text, lbl_tgllimit.Text)
            lbl_kodebooking.Text = KodeBooking
            Get_Rute(KodeBooking)
            btn_submit.Visible = True
            btn_delete.Visible = True
        Catch ex As Exception
            btn_submit.Visible = False
            btn_delete.Visible = False
        End Try


    End Sub

    Public Sub Get_Booking(ByVal s_str_kode As String, ByRef s_str_airlinecode As String, ByRef s_str_maskapai As String, ByRef s_str_servicefee As String, ByRef s_str_NTA As String, ByRef s_str_limit As String)
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
            .CommandText = "SELECT KodeBooking, Maskapai_Code , FlightName , ServiceFee , NTA , Limit_Booking  FROM TBL_T_BOOKING " _
                            & "INNER JOIN tblTravelAuthorization_Flight ON Maskapai_Code = AirlineCode WHERE KodeBooking =@KODE AND [Status] ='BIDING'"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 15).Value = s_str_kode
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_airlinecode = dr.Item("Maskapai_Code").ToString
                s_str_maskapai = dr.Item("FlightName").ToString
                s_str_servicefee = dr.Item("ServiceFee").ToString
                s_str_NTA = dr.Item("NTA").ToString
                s_str_limit = dr.Item("Limit_Booking").ToString
            Else
                s_str_airlinecode = "#"
                s_str_maskapai = "#"
                s_str_servicefee = "#"
                s_str_NTA = "#"
                s_str_limit = "#"
            End If
            con.Close()
        End With
    End Sub

    Public Sub Get_Rute(ByVal s_str_kode As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim dt As New DataTable
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        Dim dtadap As New SqlDataAdapter("SELECT distinct KodeBooking, Departure, Arrive, Convert(Varchar(10),TglBerangkat,105) TglBerangkat, JamBerangkat FROM [PERSIS].[dbo].[vw_TA_Tiket_onOrder] WHERE KodeBooking ='" & s_str_kode & "'", con)
        dtadap.Fill(dt)

        lbl_dari.Text = dt.Rows(0).Item("Departure").ToString.ToUpper
        lbl_tujuan.Text = dt.Rows(0).Item("Arrive").ToString.ToUpper
        lbl_tanggal.Text = dt.Rows(0).Item("TglBerangkat").ToString
        ddl_jam.DataBind()
        ddl_jam.SelectedValue = dt.Rows(0).Item("JamBerangkat").ToString
        ds_kelas.DataBind()
        gv_booking.DataBind()

        If dt.Rows.Count > 2 Then

            If dt.Rows(1).Item("Departure").ToString.ToUpper = dt.Rows(0).Item("Arrive").ToString.ToUpper Then
                lbl_ketransit.Text = dt.Rows(1).Item("Arrive").ToString.ToUpper
                ddl_jamtransit.DataBind()
                ddl_jamtransit.SelectedValue = dt.Rows(1).Item("JamBerangkat").ToString
                gv_transit.DataBind()
            End If

           
            If dt.Rows.Count = 4 Then
                lbl_dari_r2.Text = dt.Rows(3).Item("Departure").ToString.ToUpper
                lbl_tujuan_r2.Text = dt.Rows(3).Item("Arrive").ToString.ToUpper
                lbl_tanggal_r2.Text = dt.Rows(3).Item("TglBerangkat").ToString
                ddl_jam_r2.DataBind()
                ddl_jam_r2.SelectedValue = dt.Rows(3).Item("JamBerangkat").ToString
                gv_booking_r2.DataBind()

                lbl_ketransit_r2.Text = dt.Rows(2).Item("Arrive").ToString.ToUpper
                ddl_jamtransit_R2.DataBind()
                ddl_jamtransit_R2.SelectedValue = dt.Rows(2).Item("JamBerangkat").ToString
                gv_transit_R2.DataBind()

            Else
                lbl_dari_r2.Text = dt.Rows(2).Item("Departure").ToString.ToUpper
                lbl_tujuan_r2.Text = dt.Rows(2).Item("Arrive").ToString.ToUpper
                lbl_tanggal_r2.Text = dt.Rows(2).Item("TglBerangkat").ToString
                ddl_jam_r2.DataBind()
                ddl_jam_r2.SelectedValue = dt.Rows(2).Item("JamBerangkat").ToString
                gv_booking_r2.DataBind()
            End If

        ElseIf dt.Rows.Count > 1 Then
            lbl_dari_r2.Text = dt.Rows(1).Item("Departure").ToString.ToUpper
            lbl_tujuan_r2.Text = dt.Rows(1).Item("Arrive").ToString.ToUpper
            lbl_tanggal_r2.Text = dt.Rows(1).Item("TglBerangkat").ToString
            ddl_jam_r2.DataBind()
            ddl_jam_r2.SelectedValue = dt.Rows(1).Item("JamBerangkat").ToString
            gv_booking_r2.DataBind()
        End If

    End Sub

    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            Dim Tot_NTA As Integer = 0
            For Each Row As GridViewRow In gv_booking.Rows
                If Row.RowType = DataControlRowType.DataRow Then
                    Dim ID As Integer = gv_booking.DataKeys(Row.RowIndex).Value.ToString
                    Dim Kelas As String = TryCast(Row.Cells(0).FindControl("ddl_class"), DropDownList).SelectedValue
                    Dim NTA As String = TryCast(Row.Cells(0).FindControl("txt_NTA"), TextBox).Text
                    If NTA = "" Then
                        NTA = "0"
                    End If
                    carikoma(Trim(NTA))
                    carititik(Trim(NTA))
                    Upd_Booking(ID, ddl_jam.SelectedValue, Kelas, NTA, Left(ddl_jam.SelectedItem.Text, 2))
                    Tot_NTA = Tot_NTA + CInt(NTA)
                End If
            Next
            For Each Row As GridViewRow In gv_transit.Rows
                If Row.RowType = DataControlRowType.DataRow Then
                    Dim ID As Integer = gv_transit.DataKeys(Row.RowIndex).Value.ToString
                    Dim Kelas As String = TryCast(Row.Cells(0).FindControl("ddl_class"), DropDownList).SelectedValue
                    Dim NTA As String = TryCast(Row.Cells(0).FindControl("txt_NTA"), TextBox).Text
                    If NTA = "" Then
                        NTA = "0"
                    End If
                    carikoma(Trim(NTA))
                    carititik(Trim(NTA))
                    Upd_Booking(ID, ddl_jamtransit.SelectedValue, Kelas, NTA, Left(ddl_jamtransit.SelectedItem.Text, 2))
                    Tot_NTA = Tot_NTA + CInt(NTA)
                End If
            Next
            For Each Row As GridViewRow In gv_booking_r2.Rows
                If Row.RowType = DataControlRowType.DataRow Then
                    Dim ID As Integer = gv_booking_r2.DataKeys(Row.RowIndex).Value.ToString
                    Dim Kelas As String = TryCast(Row.Cells(0).FindControl("ddl_class"), DropDownList).SelectedValue
                    Dim NTA As String = TryCast(Row.Cells(0).FindControl("txt_NTA"), TextBox).Text
                    If NTA = "" Then
                        NTA = "0"
                    End If
                    carikoma(Trim(NTA))
                    carititik(Trim(NTA))
                    Upd_Booking(ID, ddl_jam_r2.SelectedValue, Kelas, NTA, Left(ddl_jam_r2.SelectedItem.Text, 2))
                    Tot_NTA = Tot_NTA + CInt(NTA)
                End If
            Next
            For Each Row As GridViewRow In gv_transit_R2.Rows
                If Row.RowType = DataControlRowType.DataRow Then
                    Dim ID As Integer = gv_transit_R2.DataKeys(Row.RowIndex).Value.ToString
                    Dim Kelas As String = TryCast(Row.Cells(0).FindControl("ddl_class"), DropDownList).SelectedValue
                    Dim NTA As String = TryCast(Row.Cells(0).FindControl("txt_NTA"), TextBox).Text
                    If NTA = "" Then
                        NTA = "0"
                    End If
                    carikoma(Trim(NTA))
                    carititik(Trim(NTA))
                    Upd_Booking(ID, ddl_jamtransit_R2.SelectedValue, Kelas, NTA, Left(ddl_jamtransit_R2.SelectedItem.Text, 2))
                    Tot_NTA = Tot_NTA + CInt(NTA)
                End If
            Next
            Upd_TBooking(lbl_kodebooking.Text, Tot_NTA, lbl_maskapai.Text, Session("AGENT"))
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
            ClearText()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
            ClearText()
        End Try


    End Sub
    Public Sub ClearText()
        gv_listBooking.DataBind()
        lbl_kodebooking.Text = "#"
        lbl_maskapai.Text = "#"
        lbl_Maskapaidesc.Text = "#"
        lbl_NTA.Text = "#"
        lbl_servicefee.Text = "#"
        lbl_tgllimit.Text = "#"
        lbl_dari.Text = "#"
        lbl_tujuan.Text = "#"
        lbl_tanggal.Text = "#"
        ddl_jam.DataBind()
        gv_booking.DataBind()
        lbl_dari_r2.Text = "#"
        lbl_tujuan_r2.Text = "#"
        lbl_tanggal_r2.Text = "#"
        lbl_ketransit.Text = "#"
        lbl_ketransit_r2.Text = "#"
        ddl_jam_r2.DataBind()
        ddl_jamtransit.DataBind()
        ddl_jamtransit_R2.DataBind()
        gv_booking_r2.DataBind()
        gv_transit.DataBind()
        gv_transit_R2.DataBind()
        btn_submit.Visible = False

    End Sub
    Public Sub Upd_Booking(ByVal s_int_id As Integer, ByVal s_str_jam As String, ByVal s_str_kelas As String, ByVal s_str_nta As String, ByVal s_str_maskapai As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [tblTravelAuthorization_TicketOrder] SET JamBerangkat=@JAM, KELAS=@KELAS, NTA=@NTA, AirLineCode=@MASKAPAI WHERE ID=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@JAM", SqlDbType.VarChar, 5).Value = s_str_jam
            .Parameters.Add("@KELAS", SqlDbType.VarChar, 5).Value = s_str_kelas
            .Parameters.Add("@NTA", SqlDbType.Float).Value = s_str_nta
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 5).Value = s_str_maskapai
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Upd_TBooking(ByVal s_str_kode As String, ByVal s_str_nta As String, ByVal s_str_maskapai As String, ByVal s_int_agent As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [TBL_T_BOOKING] SET NTA=@NTA WHERE Maskapai_Code=@MASKAPAI and Agent_Code=@AGENT and KodeBooking=@KODE"
            .Parameters.Add("@NTA", SqlDbType.Float).Value = s_str_nta
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 5).Value = s_str_maskapai
            .Parameters.Add("@AGENT", SqlDbType.Int).Value = s_int_agent
            .Parameters.Add("@KODE", SqlDbType.VarChar, 10).Value = s_str_kode
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Private Sub btn_delete_Click(sender As Object, e As EventArgs) Handles btn_delete.Click
        If lbl_kodebooking.Text <> "#" Then
            Del_Booking(lbl_kodebooking.Text)
            ClearText()
        End If
    End Sub

    Public Sub Del_Booking(ByVal s_str_kode As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO tblTravelAuthorization_TicketOrder_History SELECT *,'CANCEL BOOKING' [STATUS] FROM tblTravelAuthorization_TicketOrder WHERE KODEBOOKING=@KODE"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kode
            .ExecuteNonQuery()
        End With
        cmd = New SqlClient.SqlCommand
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE tblTravelAuthorization_TicketOrder WHERE KODEBOOKING=@KODE"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kode
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
End Class