Imports System.Data.SqlClient

Public Class Frm_Checkout
    Inherits System.Web.UI.Page
    <System.Web.Script.Services.ScriptMethod(), _
 System.Web.Services.WebMethod()> _
    Public Shared Function SearchNRP(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As SqlClient.SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("DB_GSISConn").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "SELECT DISTINCT TOP 10 NRP +'-'+ Nama  as NRP FROM VW_KARYAWAN_CHECKIN " _
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
            ' Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
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
    Public Sub Getdata_Reservasi(ByVal s_str_nrp As String, ByRef s_str_nama As String, ByRef s_str_telepon As String, ByRef s_str_keluarga As String, ByRef s_str_keperluan As String, ByRef s_str_lokasi As String, ByRef s_str_gedung As String, ByRef s_str_kamar As String, ByRef s_str_tujuan As String, ByRef s_str_tglcheckin As String, ByRef s_str_jamcheckin As String, ByRef s_str_tglcheckout As String)
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
            .CommandText = "SELECT * FROM CUFN_GETDATA_RESERVASI_CHECKOUT(@NRP)"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_nama = dr.Item("NAMA").ToString
                s_str_telepon = dr.Item("PHONE").ToString
                s_str_keluarga = dr.Item("STATUS_KELUARGA").ToString
                s_str_keperluan = dr.Item("KEPERLUAN").ToString
                s_str_lokasi = dr.Item("NAMA_LOKASI").ToString
                s_str_gedung = dr.Item("NAMA_GEDUNG").ToString
                s_str_kamar = dr.Item("NAMA_KAMAR").ToString
                s_str_tujuan = dr.Item("TUJUAN").ToString
                s_str_tglcheckin = dr.Item("TGL_CHECKIN").ToString
                s_str_jamcheckin = dr.Item("JAM_CHECKIN").ToString
                s_str_tglcheckout = dr.Item("TGL_CHECKOUT").ToString
            End If

            con.Close()
        End With
    End Sub
    Public Sub Ins_Checkout(ByVal s_str_nrp As String, ByVal s_str_nama As String, ByVal s_str_out As String, ByVal s_str_resep As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_CHECKOUT_KAMAR @CHECKOUT, @RESEP, @NRP, @NAMA"
            .Parameters.Add("@CHECKOUT", SqlDbType.DateTime).Value = s_str_out
            .Parameters.Add("@RESEP", SqlDbType.VarChar, 15).Value = s_str_resep
            .Parameters.Add("@NRP", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Clear()
        txt_nama.Text = ""
        txt_nohp.Text = ""
        txt_keluarga.Text = ""
        txt_keperluan.Text = ""
        txt_lokasi.Text = ""
        txt_gedung.Text = ""
        txt_kamar.Text = ""
        txt_tujuan.Text = ""
        txt_tglcheckin.Text = ""
        txt_jamcheckin.Text = ""
        txt_tglcheckout.Text = ""
        txt_jamcheckout.Text = ""

    End Sub

    Protected Sub gv_listpenghuni_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Clear()
            Dim NRP As String = gv_listpenghuni.DataKeys(e.NewSelectedIndex).Value
            If NRP <> "" Then
                txt_nrp.Text = NRP
                Getdata_Reservasi(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, txt_keluarga.Text, txt_keperluan.Text, txt_lokasi.Text, txt_gedung.Text, txt_kamar.Text, txt_tujuan.Text, txt_tglcheckin.Text, txt_jamcheckin.Text, txt_tglcheckout.Text)
                txt_jamcheckout.Text = Format(Now(), "HH:mm")
                gv_listpenghuni.DataBind()
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub txt_nrp_TextChanged(sender As Object, e As EventArgs) Handles txt_nrp.TextChanged
        Try
            Dim NRP As String() = Split(txt_nrp.Text, "-")
            txt_nrp.Text = Trim(NRP(0))
            Clear()
            If txt_nrp.Text <> "" Then

                Getdata_Reservasi(txt_nrp.Text, txt_nama.Text, txt_nohp.Text, txt_keluarga.Text, txt_keperluan.Text, txt_lokasi.Text, txt_gedung.Text, txt_kamar.Text, txt_tujuan.Text, txt_tglcheckin.Text, txt_jamcheckin.Text, txt_tglcheckout.Text)
                txt_jamcheckout.Text = Format(Now(), "HH:mm")
                gv_listpenghuni.DataBind()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btn_checkout_Click(sender As Object, e As EventArgs) Handles btn_checkout.Click
        If txt_nrp.Text <> "" And txt_nama.Text <> "" And txt_tglcheckout.Text <> "" And txt_jamcheckout.Text <> "" Then
            Ins_Checkout(txt_nrp.Text, txt_nama.Text, txt_tglcheckin.Text & " " & txt_jamcheckout.Text, Session("Nrp"))
            txt_nrp.Text = ""
            Clear()
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Checkout berhasil');", True)
        Else
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Data harus terisi dengan benar');", True)
        End If
    End Sub
End Class