Public Class Frm_RequestEvent
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            CekAkses(Session("GPID"))
       
        txt_tglmulai_CalendarExtender.StartDate = DateAdd(DateInterval.Day, 14, Today())
        txt_tglselesai_CalendarExtender.StartDate = DateAdd(DateInterval.Day, 15, Today())
        If txt_tglmulai.Text = "" Then
            txt_tglmulai.Text = Format(DateAdd(DateInterval.Day, 14, Today()), "yyyy/MM/dd")
        End If
        If txt_tglselesai.Text = "" Then
            txt_tglselesai.Text = Format(DateAdd(DateInterval.Day, 15, Today()), "yyyy/MM/dd")
        End If
        If txt_peserta.Text = "" Then
            txt_peserta.Text = "10"
            End If
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
    Protected Sub gv_listevent_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Session("ID_EVENT") = gv_listevent.DataKeys(e.NewSelectedIndex).Value
        Response.Redirect(url + "/Forms/Transactions/Event/Frm_PesertaEvent.aspx")
    End Sub

    Protected Sub gv_listevent_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Session("ID_EVENT") = gv_listevent.DataKeys(e.RowIndex).Value
            Dim Ket As String = DirectCast(gv_listevent.Rows(e.RowIndex).FindControl("txt_cancel"), TextBox).Text
            If Ket <> "" And Session("GPID") <> "RECEPTIONIST" Then
                Upd_Cancel(Session("ID_EVENT"), Ket)
                Alert_Cancel(ddl_judul.SelectedItem.Text, Format(txt_tglmulai.Text, "dd MMM yyyy") & " sampai " & Format(txt_tglselesai.Text, "dd MMM yyyy"), ddl_ruangan.SelectedItem.Text, txt_peserta.Text, Ket)
                gv_listevent.DataBind()
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Keterangan cancel wajib diisi');", True)
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try
        
    End Sub

    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            If ddl_company.SelectedValue <> "" And ddl_dekor.SelectedValue <> "" And ddl_divisi.SelectedValue <> "" And ddl_judul.SelectedValue <> "" And ddl_kategori.SelectedValue <> "" And ddl_ruangan.SelectedValue <> "" And txt_deskripsi.Text <> "" And txt_peserta.Text <> "" And txt_tglmulai.Text <> "" And txt_tglselesai.Text <> "" And Session("GPID") <> "RECEPTIONIST" Then
                Ins_Event(txt_tglmulai.Text, txt_tglselesai.Text, ddl_judul.SelectedValue, ddl_kategori.SelectedValue, ddl_divisi.SelectedValue, ddl_ruangan.SelectedValue, ddl_dekor.SelectedValue, ddl_company.SelectedValue, txt_peserta.Text, Session("Nrp"), txt_deskripsi.Text)
                Alert_Req(ddl_judul.SelectedItem.Text, Format(txt_tglmulai.Text, "dd MMM yyyy") & " sampai " & Format(txt_tglselesai.Text, "dd MMM yyyy"), ddl_ruangan.SelectedItem.Text, txt_peserta.Text)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Request Event Berhasil di input');", True)
                gv_listevent.DataBind()
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Data harus terisi lengkap dan valid');", True)
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try
       
    End Sub

    Public Sub Ins_Event(ByVal s_str_mulai As String, ByVal s_str_selesai As String, ByVal s_str_training As String, ByVal s_str_kategori As String, ByVal s_str_divisi As String, ByVal s_str_lokasi As String, ByVal s_str_dekor As String, ByVal s_str_company As String, ByVal s_str_peserta As String, ByVal s_str_reqby As String, ByVal s_str_deskripsi As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO [TBL_T_REQUEST_TRAINING]" _
                       & " ([TANGGAL_MULAI], [TANGGAL_SELESAI], [PID_TRAINING], [PID_KATEGORI_TRAINING], [PID_DEPARTMENT_TRAINING], [PID_LOKASI_TRAINING]," _
                       & " [PID_DEKOR], [PID_COMPANY], [ESTIMASI_PESERTA], [PID_REQUESTOR], [DESKRIPSI], [STATUS], [TANGGAL_REQUEST], [VERIFIKASI])" _
                       & " VALUES (@MULAI,SELESAI,@TRAINING,@KATEGORI,@DIVISI,@LOKASI,@DEKOR,@COMPANY,@PESERTA,@REQ,@DESKRIPSI,'REQUEST',GETDATE(),'BELUM')"
            .Parameters.Add("@MULAI", SqlDbType.DateTime).Value = s_str_mulai
            .Parameters.Add("@SELESAI", SqlDbType.DateTime).Value = s_str_selesai
            .Parameters.Add("@TRAINING", SqlDbType.Int).Value = s_str_training
            .Parameters.Add("@KATEGORI", SqlDbType.Int).Value = s_str_kategori
            .Parameters.Add("@DIVISI", SqlDbType.Int).Value = s_str_divisi
            .Parameters.Add("@LOKASI", SqlDbType.Int).Value = s_str_lokasi
            .Parameters.Add("@DEKOR", SqlDbType.Int).Value = s_str_dekor
            .Parameters.Add("@COMPANY", SqlDbType.Int).Value = s_str_company
            .Parameters.Add("@PESERTA", SqlDbType.Int).Value = s_str_peserta
            .Parameters.Add("@REQ", SqlDbType.VarChar, 15).Value = s_str_reqby
            .Parameters.Add("@DESKRIPSI", SqlDbType.VarChar, 500).Value = s_str_deskripsi
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Upd_Cancel(ByVal s_str_id As String, ByVal s_str_ket As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [TBL_T_REQUEST_TRAINING] STATUS='CANCEL', TGL_CANCEL=GETDATE(), KET_CANCEL=@KET WHERE PID_REQUEST_TRAINING=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .Parameters.Add("@KET", SqlDbType.VarChar, 500).Value = s_str_ket
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Alert_Req(ByVal s_str_judul As String, ByVal s_str_tgl As String, ByVal s_str_ruang As String, ByVal s_str_peserta As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_ALERT_REQ_TRAINING @JUDUL, @TGL, @RUANG, @PESERTA"
            .Parameters.Add("@JUDUL", SqlDbType.VarChar, 50).Value = s_str_judul
            .Parameters.Add("@TGL", SqlDbType.VarChar, 50).Value = s_str_tgl
            .Parameters.Add("@RUANG", SqlDbType.VarChar, 50).Value = s_str_ruang
            .Parameters.Add("@PESERTA", SqlDbType.VarChar, 50).Value = s_str_peserta
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Alert_Cancel(ByVal s_str_judul As String, ByVal s_str_tgl As String, ByVal s_str_ruang As String, ByVal s_str_peserta As String, ByVal s_str_keterangan As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_ALERT_CANCEL_TRAINING @JUDUL, @TGL, @RUANG, @PESERTA, @KET"
            .Parameters.Add("@JUDUL", SqlDbType.VarChar, 50).Value = s_str_judul
            .Parameters.Add("@TGL", SqlDbType.VarChar, 50).Value = s_str_tgl
            .Parameters.Add("@RUANG", SqlDbType.VarChar, 50).Value = s_str_ruang
            .Parameters.Add("@PESERTA", SqlDbType.VarChar, 50).Value = s_str_peserta
            .Parameters.Add("@KET", SqlDbType.VarChar, 500).Value = s_str_keterangan
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Private Sub txt_tglmulai_TextChanged(sender As Object, e As EventArgs) Handles txt_tglmulai.TextChanged
        If txt_tglmulai.Text <> "" And CDate(txt_tglmulai.Text) < DateAdd(DateInterval.Day, 14, Today()) Then
            txt_tglmulai.Text = Format(DateAdd(DateInterval.Day, 14, Today()), "yyyy/MM/dd")
        End If
       
    End Sub

    Private Sub txt_tglselesai_TextChanged(sender As Object, e As EventArgs) Handles txt_tglselesai.TextChanged
        If txt_tglselesai.Text <> "" And CDate(txt_tglmulai.Text) < DateAdd(DateInterval.Day, 15, Today()) Then
            txt_tglselesai.Text = Format(DateAdd(DateInterval.Day, 15, Today()), "yyyy/MM/dd")
        End If
    End Sub

End Class