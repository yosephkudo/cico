Imports System.Data.SqlClient

Public Class Frm_Reservasi
    Inherits System.Web.UI.Page

    <System.Web.Script.Services.ScriptMethod(), _
  System.Web.Services.WebMethod()> _
    Public Shared Function SearchNRP(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("DB_GSISConn").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "SELECT TOP 10 NRP +'-'+ Nama  as NRP FROM vw_Allkaryawan2 " _
                        & " where NRP LIKE '%' + '" + prefixText + "' + '%' or Nama Like '%' + '" + prefixText + "' + '%' order by Nama"
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("NRP").ToString)
        End While
        conn.Close()
        Return customers
    End Function
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            CekAkses(Session("GPID"))
        Catch ex As Exception
            'Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
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
                ' Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
            End If
            con.Close()
        End With

    End Sub
    Public Sub Getdata_Reservasi(ByVal s_str_nrp As String, ByRef s_str_nama As String, ByRef s_str_telepon As String, ByRef s_str_company As String, ByRef s_str_distrik As String, ByRef s_str_jabatan As String, ByRef s_str_keluarga As String, ByRef s_str_keperluan As String, ByRef s_str_checkin As String, ByRef s_str_checkout As String, ByRef s_str_lokasi As String, ByRef s_str_gedung As String, ByRef s_str_kamar As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String, ByRef s_str_notr As String)
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
            .CommandText = "SELECT * FROM CUFN_GETDATA_RESERVASI(@NRP)"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_nama = dr.Item("NAMA").ToString
                s_str_telepon = dr.Item("TELEPON").ToString
                s_str_company = dr.Item("COMPANY").ToString
                s_str_distrik = dr.Item("DISTRIK").ToString
                s_str_jabatan = dr.Item("JABATAN").ToString
                s_str_keluarga = dr.Item("STATUS_KELUARGA").ToString
                s_str_keperluan = dr.Item("KEPERLUAN").ToString
                s_str_checkin = dr.Item("CHECKIN").ToString
                s_str_checkout = dr.Item("CHECKOUT").ToString
                s_str_lokasi = dr.Item("LOKASI").ToString
                s_str_gedung = dr.Item("GEDUNG").ToString
                s_str_kamar = dr.Item("KAMAR").ToString
                s_str_dari = dr.Item("DARI").ToString
                s_str_tujuan = dr.Item("TUJUAN").ToString
                s_str_notr = dr.Item("NO_TR").ToString
            End If
            con.Close()
        End With
    End Sub

    Public Sub Cancel_Reservasi(ByVal s_str_ket As String, ByVal s_str_nrp As String, ByVal s_str_nama As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [TBL_T_TRAVEL_REQUEST_KARYAWAN] SET IsCancel=1, KetCancel=@KET, IDBed=NULL WHERE NRP=@NRP AND NAMA=@NAMA AND CAST(MESSCI AS DATE)>CAST(GETDATE()-2 AS DATE)"
            .Parameters.Add("@KET", SqlDbType.VarChar, 200).Value = s_str_ket
            '.Parameters.Add("@IDBED", SqlDbType.VarChar, 50).Value = s_str_IDBed
            .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama

            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Delete_Reservasi(ByVal s_str_nrp As String, ByVal s_str_nama As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE [TBL_T_TRANSIT_PEGAWAI] WHERE NRP=@NRP AND NAMA=@NAMA AND CAST(TGL_CHECKIN AS DATE)>CAST(GETDATE()-2 AS DATE) AND STATUS_CHECK='BOOKING'"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Ins_Booking(ByVal s_str_nrp As String, ByVal s_str_nama As String, ByVal s_str_hp As String, ByVal s_str_company As String, ByVal s_str_jabatan As String, ByVal s_str_keperluan As String, ByVal s_str_in As String, ByVal s_str_out As String, ByVal s_str_kamar As String, ByVal s_str_asal As String, ByVal s_str_tujuan As String, ByVal s_str_site As String, ByVal s_str_notr As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_BOOKING_KAMAR @NRP,@NAMA,@NOHP,@COMPANY,@JABATAN,@KEPERLUAN,@IN,@OUT,@KAMAR,@ASAL,@TUJUAN,@SITE,@NO_TR"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
            .Parameters.Add("@NOHP", SqlDbType.VarChar, 20).Value = s_str_hp
            .Parameters.Add("@COMPANY", SqlDbType.VarChar, 20).Value = s_str_company
            .Parameters.Add("@JABATAN", SqlDbType.VarChar, 50).Value = s_str_jabatan
            .Parameters.Add("@KEPERLUAN", SqlDbType.VarChar, 50).Value = s_str_keperluan
            .Parameters.Add("@IN", SqlDbType.VarChar, 20).Value = s_str_in
            .Parameters.Add("@OUT", SqlDbType.VarChar, 10).Value = s_str_out
            .Parameters.Add("@KAMAR", SqlDbType.Int).Value = s_str_kamar
            .Parameters.Add("@ASAL", SqlDbType.VarChar, 20).Value = s_str_asal
            .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 20).Value = s_str_tujuan
            .Parameters.Add("@SITE", SqlDbType.VarChar, 20).Value = s_str_site
            .Parameters.Add("@NO_TR", SqlDbType.VarChar, 20).Value = s_str_notr
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Ins_Checkin(ByVal s_str_nrp As String, ByVal s_str_nama As String, ByVal s_str_hp As String, ByVal s_str_company As String, ByVal s_str_jabatan As String, ByVal s_str_keperluan As String, ByVal s_str_in As String, ByVal s_str_out As String, ByVal s_str_kamar As String, ByVal s_str_asal As String, ByVal s_str_tujuan As String, ByVal s_str_site As String, ByVal s_str_notr As String, ByVal s_str_resep As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_CHECKIN_KAMAR @NRP,@NAMA,@NOHP,@COMPANY,@JABATAN,@KEPERLUAN,@IN,@OUT,@KAMAR,@ASAL,@TUJUAN,@SITE,@NO_TR,@RESEP"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
            .Parameters.Add("@NOHP", SqlDbType.VarChar, 20).Value = s_str_hp
            .Parameters.Add("@COMPANY", SqlDbType.VarChar, 20).Value = s_str_company
            .Parameters.Add("@JABATAN", SqlDbType.VarChar, 50).Value = s_str_jabatan
            .Parameters.Add("@KEPERLUAN", SqlDbType.VarChar, 50).Value = s_str_keperluan
            .Parameters.Add("@IN", SqlDbType.VarChar, 20).Value = s_str_in
            .Parameters.Add("@OUT", SqlDbType.VarChar, 10).Value = s_str_out
            .Parameters.Add("@KAMAR", SqlDbType.Int).Value = s_str_kamar
            .Parameters.Add("@ASAL", SqlDbType.VarChar, 20).Value = s_str_asal
            .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 20).Value = s_str_tujuan
            .Parameters.Add("@SITE", SqlDbType.VarChar, 20).Value = s_str_site
            .Parameters.Add("@NO_TR", SqlDbType.VarChar, 50).Value = s_str_notr
            .Parameters.Add("@RESEP", SqlDbType.VarChar, 15).Value = s_str_resep
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Updt_Booking(ByVal s_str_nrp As String, ByVal s_str_nama As String, ByVal s_str_hp As String, ByVal s_str_company As String, ByVal s_str_jabatan As String, ByVal s_str_keperluan As String, ByVal s_str_in As String, ByVal s_str_out As String, ByVal s_str_gedung As String, ByVal s_str_kamar As String, ByVal s_str_asal As String, ByVal s_str_tujuan As String, ByVal s_str_site As String, ByVal s_str_notr As String)
        'Dim con As SqlClient.SqlConnection = Nothing
        'Dim cmd As SqlClient.SqlCommand = Nothing
        'cmd = New SqlClient.SqlCommand
        'Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        'con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        'con.Open()
        'With cmd
        '    .Connection = con
        '    .CommandType = CommandType.Text
        '    .CommandText = "EXECUTE SP_BOOKING_UPDATE @NRP,@NAMA,@NOHP,@COMPANY,@JABATAN,@KEPERLUAN,@IN,@OUT,@KAMAR,@ASAL,@TUJUAN,@SITE,@NO_TR"
        '    ' .CommandText = "BEGIN TRANSACTION;
        '    'UPDATE TBL_T_TRAVEL_REQUEST_KARYAWAN  SET TBL_T_TRAVEL_REQUEST_KARYAWAN.NO_HP=@NOHP, TBL_T_TRAVEL_REQUEST_KARYAWAN.Jabatan=@JABATAN, TBL_T_TRAVEL_REQUEST_KARYAWAN.Keperluan_BBSO=@KEPERLUAN,  
        '    'TBL_T_TRAVEL_REQUEST_KARYAWAN.IDBed=@KAMAR, TBL_T_TRAVEL_REQUEST_KARYAWAN.DARI=@ASAL, TBL_T_TRAVEL_REQUEST_KARYAWAN.TUJUAN=@TUJUAN, TBL_T_TRAVEL_REQUEST_KARYAWAN.Site=@SITE 
        '    'From TBL_T_TRAVEL_REQUEST_KARYAWAN T1, TBL_T_TRANSIT_PEGAWAI T2
        '    'WHERE T1.PID_Transit = T2.PID_TRANSIT_PEGAWAI AND T1.NRP=@NRP AND T1.NAMA=@NAMA AND T2.TGL_CHECKIN=@IN AND T2.TGL_CHECKOUT=@OUT AND T1.NO_TR=@NO_TR AND CAST(MessCI AS DATE)>CAST(GETDATE()-2 AS DATE) AND T2.STATUS_CHECK='BOOKING'; 
        '    'UPDATE TBL_T_TRANSIT_PEGAWAI SET TBL_T_TRANSIT_PEGAWAI.TGL_CHECKIN=@IN, TBL_T_TRANSIT_PEGAWAI.TGL_CHECKOUT=@OUT FROM TBL_T_TRANSIT_PEGAWAI T2, TBL_T_TRAVEL_REQUEST_KARYAWAN T1 WHERE T2.PID_TRANSIT_PEGAWAI = T1.PID_Transit AND T1.NO_TR=@NO_TR; COMMIT;"

        '    .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
        '    .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
        '    .Parameters.Add("@NOHP", SqlDbType.VarChar, 20).Value = s_str_hp
        '    .Parameters.Add("@COMPANY", SqlDbType.VarChar, 20).Value = s_str_company
        '    .Parameters.Add("@JABATAN", SqlDbType.VarChar, 50).Value = s_str_jabatan
        '    .Parameters.Add("@KEPERLUAN", SqlDbType.VarChar, 50).Value = s_str_keperluan
        '    .Parameters.Add("@IN", SqlDbType.VarChar, 20).Value = s_str_in
        '    .Parameters.Add("@OUT", SqlDbType.VarChar, 10).Value = s_str_out
        '    '.Parameters.Add("@GEDUNG", SqlDbType.Int).Value = s_str_gedung
        '    .Parameters.Add("@KAMAR", SqlDbType.Int).Value = s_str_kamar
        '    .Parameters.Add("@ASAL", SqlDbType.VarChar, 20).Value = s_str_asal
        '    .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 20).Value = s_str_tujuan
        '    .Parameters.Add("@SITE", SqlDbType.VarChar, 20).Value = s_str_site
        '    .Parameters.Add("@NO_TR", SqlDbType.VarChar, 20).Value = s_str_notr
        '    .ExecuteNonQuery()
        'End With
        'con.Close()
    End Sub

    Private Sub txt_nrp_TextChanged(sender As Object, e As EventArgs) Handles txt_nrp.TextChanged


        Try

            If txt_nrp.Text <> "" Then
                Dim NRP As String() = Split(txt_nrp.Text, "-")
                txt_nrp.Text = Trim(NRP(0))
                Clear()
                Dim i_lokasi As String
                Dim i_gedung As String
                Dim i_kamar As String
                Session("NO_TR") = ""
                Getdata_Reservasi(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, ddl_company.SelectedValue, ddl_distrik.SelectedValue, txt_jabatan.Text, ddl_keluarga.SelectedValue, ddl_keperluan.SelectedValue, txt_tglcheckin.Text, txt_checkout.Text, i_lokasi, i_gedung, i_kamar, ddl_kedatangan.SelectedValue, ddl_tujuan.SelectedValue, Session("NO_TR"))
                txt_jamcheckin.Text = Format(Now(), "HH: mm")
                If i_lokasi <> "" Then
                    ddl_lokasi.SelectedValue = i_lokasi
                    ddl_gedung.DataBind()
                    ddl_gedung.SelectedValue = i_gedung
                    ddl_kamar.DataSource = ds_kamar
                    ddl_kamar.DataTextField = "NAMA_KAMAR"
                    ddl_kamar.DataValueField = "PID_DETAIL_MESS"
                    ddl_kamar.DataBind()
                    ddl_kamar.SelectedValue = i_kamar
                    btn_booking.Visible = False
                Else
                    If Session("NO_TR") = "" Then
                        btn_booking.Visible = True
                    Else

                        btn_booking.Visible = True
                    End If

                End If
                'gv_tiket.DataBind()
            End If
        Catch ex As Exception

        End Try

    End Sub

    Public Sub Clear()
        btn_booking.Visible = False
        txt_nama.Text = ""
        txt_nohp.Text = ""
        ddl_company.SelectedValue = ""
        ddl_distrik.SelectedValue = ""
        txt_jabatan.Text = ""
        ddl_keluarga.SelectedValue = ""
        ddl_keperluan.SelectedValue = ""
        txt_tglcheckin.Text = ""
        txt_jamcheckin.Text = ""
        txt_checkout.Text = ""
        ddl_lokasi.SelectedValue = ""
        ddl_gedung.DataBind()
        ddl_gedung.SelectedValue = ""
        ddl_kamar.DataBind()
        ddl_kamar.SelectedValue = ""
        ddl_kedatangan.SelectedValue = ""
        ddl_tujuan.SelectedValue = ""
        Session("NO_TR") = ""
        ddl_caridistrik.DataBind()
        'gv_tiket.DataBind()
        ' gv_listreq.DataBind()
    End Sub

    Protected Sub gv_listreq_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Clear()
            Session("NO_TR") = ""
            Dim NRP As String = gv_listreq.DataKeys(e.NewSelectedIndex).Value
            ' Session("NO_TR") = gv_listreq.Rows(e.NewSelectedIndex).Cells(6).Text
            If NRP <> "" Then
                txt_nrp.Text = NRP
                Dim i_lokasi As String
                Dim i_gedung As String
                Dim i_kamar As String
                Getdata_Reservasi(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, ddl_company.SelectedValue, ddl_distrik.SelectedValue, txt_jabatan.Text, ddl_keluarga.SelectedValue, ddl_keperluan.SelectedValue, txt_tglcheckin.Text, txt_checkout.Text, i_lokasi, i_gedung, i_kamar, ddl_kedatangan.SelectedValue, ddl_tujuan.SelectedValue, Session("NO_TR"))
                txt_jamcheckin.Text = Format(Now(), "HH:mm")
                If i_lokasi <> "" Then
                    btn_booking.Visible = False
                    ddl_lokasi.SelectedValue = i_lokasi
                    ddl_gedung.DataBind()
                    ddl_gedung.SelectedValue = i_gedung
                    ddl_kamar.DataSource = ds_kamar
                    ddl_kamar.DataTextField = "NAMA_KAMAR"
                    ddl_kamar.DataValueField = "PID_DETAIL_MESS"
                    ddl_kamar.DataBind()
                    ddl_kamar.SelectedValue = i_kamar
                    btn_booking.Visible = False
                    btn_update.Visible = True
                Else
                    If Session("NO_TR") = "" Then
                        btn_booking.Visible = True

                    Else

                        btn_booking.Visible = True
                    End If
                End If
                'gv_tiket.DataBind()
            End If
        Catch ex As Exception
        End Try


    End Sub

    Private Sub ddl_gedung_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_gedung.SelectedIndexChanged
        If ddl_kamar.DataSource = Nothing Then
            ddl_kamar.DataSource = ds_kamar
            ddl_kamar.DataTextField = "NAMA_KAMAR"
            ddl_kamar.DataValueField = "PID_DETAIL_MESS"
        End If
        ds_kamar.DataBind()
        ddl_kamar.DataBind()
    End Sub

    Private Sub ddl_lokasi_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_lokasi.SelectedIndexChanged
        ds_gedung.DataBind()
        ddl_gedung.DataBind()
        ds_kamar.DataBind()
        ddl_kamar.DataBind()
    End Sub

    Protected Sub gv_listreq_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim i_NRP As String = gv_listreq.DataKeys(e.RowIndex).Value
            Dim i_Nama As String = gv_listreq.Rows(e.RowIndex).Cells(2).Text
            Dim i_Remark As String = DirectCast(gv_listreq.Rows(e.RowIndex).FindControl("txt_remark"), TextBox).Text
            If i_NRP <> "" And i_Nama <> "" And i_Remark <> "" Then
                Cancel_Reservasi(i_Remark, i_NRP, i_Nama)
                Delete_Reservasi(i_NRP, i_Nama)
            End If
            gv_listreq.DataBind()
        Catch ex As Exception

        End Try

    End Sub

    Private Sub btn_booking_Click(sender As Object, e As EventArgs) Handles btn_booking.Click
        If txt_nrp.Text <> "" And txt_nama.Text <> "" And ddl_company.SelectedValue <> "" And ddl_distrik.SelectedValue <> "" And txt_jabatan.Text <> "" And ddl_keluarga.SelectedValue <> "" And ddl_keperluan.SelectedValue <> "" And txt_tglcheckin.Text <> "" And txt_jamcheckin.Text <> "" And txt_checkout.Text <> "" And ddl_kedatangan.SelectedValue <> "" And ddl_tujuan.SelectedValue <> "" And ddl_kamar.SelectedValue <> "" Then

            If ddl_gedung.SelectedItem.Text = "ANTASARI" And Session("GPID") <> "GS ADMIN" Then
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Akses Booking gedung Antasari hanya dari GS Admin');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            Else
                Ins_Booking(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, ddl_company.SelectedValue, txt_jabatan.Text, ddl_keperluan.SelectedValue, txt_tglcheckin.Text & " " & txt_jamcheckin.Text, txt_checkout.Text, ddl_kamar.SelectedValue, ddl_kedatangan.SelectedValue, ddl_tujuan.SelectedValue, ddl_distrik.SelectedValue, Session("NO_TR"))
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Booking berhasil');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            End If

        Else
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Pastikan semua terisi dengan lengkap dan benar');", True)
        End If
    End Sub

    Private Sub btn_checkin_Click(sender As Object, e As EventArgs) Handles btn_checkin.Click
        If txt_nrp.Text <> "" And txt_nama.Text <> "" And ddl_company.SelectedValue <> "" And ddl_distrik.SelectedValue <> "" And txt_jabatan.Text <> "" And ddl_keluarga.SelectedValue <> "" And ddl_keperluan.SelectedValue <> "" And txt_tglcheckin.Text <> "" And txt_jamcheckin.Text <> "" And txt_checkout.Text <> "" And ddl_kedatangan.SelectedValue <> "" And ddl_tujuan.SelectedValue <> "" Then
            If ddl_gedung.SelectedItem.Text = "ANTASARI" And Session("GPID") <> "GS ADMIN" And Session("NO_TR") = "" Then
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Akses Checkin tanpa booking gedung Antasari hanya dari GS Admin');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            Else
                Ins_Checkin(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, ddl_company.SelectedValue, txt_jabatan.Text, ddl_keperluan.SelectedValue, txt_tglcheckin.Text & " " & txt_jamcheckin.Text, txt_checkout.Text, ddl_kamar.SelectedValue, ddl_kedatangan.SelectedValue, ddl_tujuan.SelectedValue, ddl_distrik.SelectedValue, Session("NO_TR"), Session("Nrp"))
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Checkin berhasil');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            End If

        Else
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Pastikan semua terisi dengan lengkap dan benar');", True)
        End If
    End Sub

    Private Sub btn_clear_Click(sender As Object, e As EventArgs) Handles btn_clear.Click
        Clear()
    End Sub

    Protected Sub btn_update_Click(sender As Object, e As EventArgs) Handles btn_update.Click

        If txt_nrp.Text <> "" And txt_nama.Text <> "" And ddl_company.SelectedValue <> "" And ddl_distrik.SelectedValue <> "" And txt_jabatan.Text <> "" And ddl_keluarga.SelectedValue <> "" And ddl_keperluan.SelectedValue <> "" And txt_tglcheckin.Text <> "" And txt_jamcheckin.Text <> "" And txt_checkout.Text <> "" And ddl_kedatangan.SelectedValue <> "" And ddl_tujuan.SelectedValue <> "" And ddl_kamar.SelectedValue <> "" Then

            If ddl_gedung.SelectedItem.Text = "ANTASARI" And Session("GPID") <> "GS ADMIN" Then
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Akses Booking gedung Antasari hanya dari GS Admin');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            Else
                Updt_Booking(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, ddl_company.SelectedValue, txt_jabatan.Text, ddl_keperluan.SelectedValue, txt_tglcheckin.Text & " " & txt_jamcheckin.Text, txt_checkout.Text, ddl_kamar.SelectedValue, ddl_gedung.SelectedValue, ddl_kedatangan.SelectedValue, ddl_tujuan.SelectedValue, ddl_distrik.SelectedValue, Session("NO_TR"))
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Update berhasil');", True)
                Session("NO_TR") = ""
                gv_listreq.DataBind()
                Clear()
            End If

        Else
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Pastikan semua terisi dengan lengkap dan benar');", True)
        End If

    End Sub
End Class