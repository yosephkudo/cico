Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Text
Public Class Frm_NewBooking
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
    Public Sub GetDetail(ByVal s_int_id As Integer, ByVal s_str_TA As String, ByRef s_str_tanggal As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String)
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
            .CommandText = "SELECT Convert(varchar(10),Tanggal,105) Tanggal, Upper(dari) dari, Upper(Tujuan) Tujuan FROM VW_TA_FLIGHT WHERE ID=@ID AND TravelAuthorizeNo =@TA"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@TA", SqlDbType.VarChar, 50).Value = s_str_TA
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_tanggal = dr.Item("Tanggal").ToString
                s_str_dari = dr.Item("Dari").ToString
                s_str_tujuan = dr.Item("Tujuan").ToString
            Else
                s_str_tanggal = "#"
                s_str_dari = "#"
                s_str_tujuan = "#"
            End If
            con.Close()
        End With
    End Sub

    Public Sub GetServiceFee(ByVal s_int_agent As Integer, ByVal s_str_host As String, ByRef s_str_servicefee As String)
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
            .CommandText = "SELECT ServiceFee FROM CUFN_SERVICEFEE(@AGENT,@HOST)"
            .Parameters.Add("@AGENT", SqlDbType.Int).Value = s_int_agent
            .Parameters.Add("@HOST", SqlDbType.VarChar, 50).Value = s_str_host
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_servicefee = dr.Item("ServiceFee").ToString
            Else
                s_str_servicefee = "0"
            End If
        End With
        con.Close()
        gv_booking.DataBind()
        gv_booking_r2.DataBind()
        gv_transit.DataBind()
        gv_transit_R2.DataBind()
    End Sub

    Public Sub Ins_Temp(ByVal s_int_id As Integer, ByVal s_str_nomor As String, ByVal s_str_agent As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO TBL_TEMP_BOOKING (ID, NOMORST, HOSTNAME, ID_AGENT) VALUES (@ID,@NOMOR,@HOST,@AGENT)"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@NOMOR", SqlDbType.VarChar, 10).Value = s_str_nomor
            .Parameters.Add("@HOST", SqlDbType.VarChar, 50).Value = Session("Host")
            .Parameters.Add("@AGENT", SqlDbType.VarChar, 5).Value = s_str_agent
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Upd_Temp(ByVal s_int_id As Integer, ByVal s_str_agent As String, ByVal s_str_jam As String, ByVal s_str_kelas As String, ByVal s_str_nta As String, ByVal s_str_maskapai As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE TBL_TEMP_BOOKING SET JAM=@JAM, KELAS=@KELAS, NTA=@NTA, AIRLINE=@MASKAPAI WHERE ID=@ID AND HOSTNAME=@HOST  AND ID_AGENT=@AGENT"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@HOST", SqlDbType.VarChar, 50).Value = Session("Host")
            .Parameters.Add("@AGENT", SqlDbType.VarChar, 5).Value = s_str_agent
            .Parameters.Add("@JAM", SqlDbType.VarChar, 5).Value = s_str_jam
            .Parameters.Add("@KELAS", SqlDbType.VarChar, 5).Value = s_str_kelas
            .Parameters.Add("@NTA", SqlDbType.Float).Value = s_str_nta
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 10).Value = s_str_maskapai
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Exc_Booking(ByVal s_str_kode As String, ByVal s_str_maskapai As String, ByVal s_flo_nta As String, ByVal s_int_agent As Integer, ByVal s_flo_fee As String, ByVal s_dtm_limit As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_NEW_BOOKING @KODE,@MASKAPAI,@NTA,@FEE,@LIMIT,@AGENT"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kode
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 10).Value = s_str_maskapai
            .Parameters.Add("@NTA", SqlDbType.Float).Value = s_flo_nta
            .Parameters.Add("@AGENT", SqlDbType.Int).Value = s_int_agent
            .Parameters.Add("@FEE", SqlDbType.Float).Value = s_flo_fee
            .Parameters.Add("@LIMIT", SqlDbType.DateTime).Value = s_dtm_limit
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Del_Temp(ByVal s_int_id As Integer, ByVal s_str_agent As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE TBL_TEMP_BOOKING WHERE ID=@ID AND HOSTNAME=@HOST AND ID_AGENT=@AGENT"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@HOST", SqlDbType.VarChar, 50).Value = Session("Host")
            .Parameters.Add("@AGENT", SqlDbType.VarChar, 5).Value = s_str_agent
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Del_AllTemp(ByVal s_str_agent As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE TBL_TEMP_BOOKING WHERE HOSTNAME=@HOST AND ID_AGENT=@AGENT"
            .Parameters.Add("@HOST", SqlDbType.VarChar, 50).Value = Session("Host")
            .Parameters.Add("@AGENT", SqlDbType.VarChar, 5).Value = s_str_agent
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Function Cek_KodeBooking(ByVal s_str_kodebooking) As Boolean
        Dim Status As Boolean = True
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
            .CommandText = "SELECT KodeBooking FROM TBL_T_BOOKING WHERE KODEBOOKING=@KODE"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 15).Value = s_str_kodebooking
            dr = .ExecuteReader
            If dr.Read = True Then
                Status = True
            Else
                Status = False
            End If
        End With
        con.Close()
        Return Status
    End Function
    Dim PP As Integer = 1
    Sub carikoma(ByRef s_str_data As String)
        Try
            If s_str_data = "" Then
                s_str_data = "0"
            End If
            Dim array() As String
            array = s_str_data.Split(",")
            s_str_data = array(0).ToString + "" + array(1).ToString
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


    Private Sub btn_one_Click(sender As Object, e As EventArgs) Handles btn_one.Click
        btn_one.CssClass = "btn btn-google"
        btn_pp.CssClass = "btn btn-instagram"
        For Each Row As GridViewRow In gv_booking_r2.Rows
            If Row.RowType = DataControlRowType.DataRow Then
                Dim ID As Integer = gv_booking_r2.DataKeys(Row.RowIndex).Value.ToString
                Del_Temp(ID, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            End If
        Next
        gv_booking_r2.DataBind()
        gv_transit_R2.DataBind()
        gv_listTA.DataBind()
        If gv_booking_r2.Rows.Count = 0 Then
            lbl_dari_r2.Text = "#"
            lbl_tujuan_r2.Text = "#"
            lbl_tanggal_r2.Text = "#"

        End If
        If gv_transit_R2.Rows.Count = 0 Then
            lbl_ketransit_R2.Text = "#"
        End If
        box_r2.Visible = False
        PP = 0
    End Sub

    Private Sub btn_pp_Click(sender As Object, e As EventArgs) Handles btn_pp.Click
        btn_one.CssClass = "btn btn-instagram"
        btn_pp.CssClass = "btn btn-google"
        box_r2.Visible = True
        PP = 1
    End Sub


    Protected Sub gv_listTA_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Dim ID As Integer = gv_listTA.DataKeys(e.NewSelectedIndex).Value
            Dim Nomor As String = gv_listTA.Rows(e.NewSelectedIndex).Cells(1).Text
            Dim Dari As String = gv_listTA.Rows(e.NewSelectedIndex).Cells(4).Text
            Dim Tujuan As String = gv_listTA.Rows(e.NewSelectedIndex).Cells(5).Text
            Dim Tanggal As String = Left(gv_listTA.Rows(e.NewSelectedIndex).Cells(3).Text, 10)

            If lbl_tanggal.Text = "#" And gv_booking.Rows.Count = 0 Then
                GetDetail(ID, ddl_TA.SelectedValue, lbl_tanggal.Text, lbl_dari.Text, lbl_tujuan.Text)
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            ElseIf lbl_tanggal.Text <> "#" And gv_booking.Rows.Count >= 1 And Dari.ToUpper = lbl_dari.Text.ToUpper And Tujuan.ToUpper = lbl_tujuan.Text.ToUpper And lbl_tanggal.Text = Tanggal Then
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            ElseIf lbl_tanggal.Text <> "#" And gv_booking.Rows.Count >= 1 And Dari.ToUpper = lbl_tujuan.Text.ToUpper And lbl_tanggal.Text = Tanggal Then
                lbl_ketransit.Text = Tujuan.ToUpper
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            ElseIf lbl_tanggal_r2.Text = "#" And gv_booking_r2.Rows.Count = 0 And PP = 1 Then
                GetDetail(ID, ddl_TA.SelectedValue, lbl_tanggal_r2.Text, lbl_dari_r2.Text, lbl_tujuan_r2.Text)
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            ElseIf lbl_tanggal_r2.Text <> "#" And gv_booking_r2.Rows.Count > 0 And Dari.ToUpper = lbl_dari_r2.Text.ToUpper And Tujuan.ToUpper = lbl_tujuan_r2.Text.ToUpper And lbl_tanggal_r2.Text = Tanggal And PP = 1 Then
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            ElseIf lbl_tanggal_r2.Text <> "#" And gv_booking_r2.Rows.Count >= 1 And Dari.ToUpper = lbl_tujuan_r2.Text.ToUpper And lbl_tanggal_r2.Text = Tanggal Then
                lbl_ketransit_R2.Text = Tujuan.ToUpper
                Ins_Temp(ID, Nomor, Session("Agent"))
                GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Rute tidak sesuai');", True)
            End If

            gv_booking.DataBind()
            gv_booking_r2.DataBind()
            gv_listTA.DataBind()
            ds_kelas.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
    End Sub


    Protected Sub gv_booking_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As Integer = gv_booking.DataKeys(e.RowIndex).Value
            Del_Temp(ID, Session("Agent"))
            GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            gv_booking.DataBind()
            gv_listTA.DataBind()
            If gv_booking.Rows.Count = 0 Then
                lbl_dari.Text = "#"
                lbl_tujuan.Text = "#"
                lbl_tanggal.Text = "#"

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try

    End Sub

    Protected Sub gv_booking_r2_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As Integer = gv_booking_r2.DataKeys(e.RowIndex).Value
            Del_Temp(ID, Session("Agent"))
            GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            gv_booking_r2.DataBind()
            gv_listTA.DataBind()
            If gv_booking_r2.Rows.Count = 0 Then
                lbl_dari_r2.Text = "#"
                lbl_tujuan_r2.Text = "#"
                lbl_tanggal_r2.Text = "#"

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
    End Sub

    Private Sub ddl_TA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_TA.SelectedIndexChanged
        Del_AllTemp(Session("Agent"))
        gv_booking.DataBind()
        gv_booking_r2.DataBind()
        gv_transit.DataBind()
        gv_transit_R2.DataBind()
        ddl_area.DataBind()
        gv_listTA.DataBind()
        lbl_dari.Text = "#"
        lbl_tujuan.Text = "#"
        lbl_tanggal.Text = "#"
        lbl_dari_r2.Text = "#"
        lbl_tujuan_r2.Text = "#"
        lbl_tanggal_r2.Text = "#"
        lbl_ketransit.Text = "#"
        lbl_ketransit_R2.Text = "#"
        lbl_servicefee.Text = "0"
    End Sub


    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        If txt_kodebooking.Text <> "" And txt_jamlimit.Text <> "" And txt_tgllimit.Text <> "" And txt_kodebooking.Text <> "" And lbl_servicefee.Text > 0 And ddl_jam.SelectedValue <> "" And gv_booking.Rows.Count > 0 Then
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
                        Upd_Temp(ID, Session("Agent"), ddl_jam.SelectedValue, Kelas, NTA, Left(ddl_jam.SelectedItem.Text, 2))
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
                        Upd_Temp(ID, Session("Agent"), ddl_jamtransit.SelectedValue, Kelas, NTA, Left(ddl_jamtransit.SelectedItem.Text, 2))
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
                        Upd_Temp(ID, Session("Agent"), ddl_jam_r2.SelectedValue, Kelas, NTA, Left(ddl_jam_r2.SelectedItem.Text, 2))
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
                        Upd_Temp(ID, Session("Agent"), ddl_jamtransit_R2.SelectedValue, Kelas, NTA, Left(ddl_jamtransit_R2.SelectedItem.Text, 2))
                        Tot_NTA = Tot_NTA + CInt(NTA)
                    End If
                Next
                If Tot_NTA = "0" Then
                    Del_AllTemp(Session("Agent"))
                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('NTA Tidak boleh kosong, silahkan inputkan kembali');", True)
                Else
                    Exc_Booking(txt_kodebooking.Text, ddl_maskapai.SelectedValue, Tot_NTA, Session("Agent"), lbl_servicefee.Text, Format(CDate(txt_tgllimit.Text & " " & txt_jamlimit.Text), "yyyy/MM/dd HH:mm"))

                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
                End If
                gv_booking.DataBind()
                gv_transit.DataBind()
                gv_booking_r2.DataBind()
                gv_transit_R2.DataBind()
                txt_kodebooking.Text = ""
                lbl_servicefee.Text = "0"
                txt_tgllimit.Text = ""
                txt_jamlimit.Text = ""
                gv_listTA.DataBind()
                lbl_dari.Text = "#"
                lbl_tujuan.Text = "#"
                lbl_tanggal.Text = "#"
                lbl_ketransit.Text = "#"
                lbl_dari_r2.Text = "#"
                lbl_tujuan_r2.Text = "#"
                lbl_tanggal_r2.Text = "#"
                lbl_ketransit_R2.Text = "#"
                ddl_jam.DataBind()
                ddl_jamtransit.DataBind()
                ddl_jam_r2.DataBind()
                ddl_jamtransit_R2.DataBind()
            Catch ex As Exception

                Del_AllTemp(Session("Agent"))
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error : " & ex.Message & "');", True)
                gv_booking.DataBind()
                gv_transit.DataBind()
                gv_booking_r2.DataBind()
                gv_transit_R2.DataBind()
            End Try



        Else
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Harus lengkap terisi');", True)
        End If
    End Sub

    Private Sub ddl_area_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_area.SelectedIndexChanged
        gv_listTA.DataBind()
    End Sub

    Protected Sub gv_transit_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As Integer = gv_transit.DataKeys(e.RowIndex).Value
            Del_Temp(ID, Session("Agent"))
            GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            gv_transit.DataBind()
            gv_listTA.DataBind()
            If gv_transit.Rows.Count = 0 Then
                lbl_ketransit.Text = "#"

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
    End Sub

    Protected Sub gv_transit_R2_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As Integer = gv_transit_R2.DataKeys(e.RowIndex).Value
            Del_Temp(ID, Session("Agent"))
            GetServiceFee(Session("Agent"), Session("Host"), lbl_servicefee.Text)
            gv_transit_R2.DataBind()
            gv_listTA.DataBind()
            If gv_transit_R2.Rows.Count = 0 Then
                lbl_ketransit_R2.Text = "#"

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
    End Sub

    Private Sub ddl_maskapai_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_maskapai.SelectedIndexChanged
        ddl_jam.DataBind()
        ddl_jam_r2.DataBind()
        ddl_jamtransit.DataBind()
        ddl_jamtransit_R2.DataBind()
        gv_booking.DataBind()
        gv_booking_r2.DataBind()
        gv_transit.DataBind()
        gv_transit_R2.DataBind()
    End Sub

    Private Sub txt_kodebooking_TextChanged(sender As Object, e As EventArgs) Handles txt_kodebooking.TextChanged
        If txt_kodebooking.Text <> "" Then
            If Cek_KodeBooking(txt_kodebooking.Text) = True Then
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Kodebooking sudah pernah diinput di sistem');", True)
                txt_kodebooking.Text = ""
            End If
        End If
    End Sub


End Class