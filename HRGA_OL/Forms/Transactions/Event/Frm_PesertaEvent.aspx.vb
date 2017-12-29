Imports System.Data.SqlClient

Public Class Frm_PesertaEvent
    Inherits System.Web.UI.Page
    <System.Web.Script.Services.ScriptMethod(), _
 System.Web.Services.WebMethod()> _
    Public Shared Function SearchNRP(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("DB_GSISConn").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "SELECT TOP 10 NRP +'-'+ Nama  as NRP FROM vw_Allkaryawan " _
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("ID_EVENT").ToString <> "" And lbl_idtraining.Text = "#" Then
                lbl_idtraining.Text = Session("ID_EVENT")
                Get_Training(lbl_idtraining.Text, lbl_training.Text, lbl_tanggal.Text, lbl_diajukan.Text)
                gv_kebutuhan.DataBind()
                gv_peserta.DataBind()
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub

    Public Sub Get_Training(ByRef s_str_id As String, ByRef s_str_training As String, ByRef s_str_tanggal As String, ByRef s_str_diajukan As String)
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
            .CommandText = "SELECT [PID_REQUEST_TRAINING],[NAMA_TRAINING],[TANGGAL_MULAI] +' - ' + [TANGGAL_SELESAI] TANGGAL,[PID_REQUESTOR] FROM [VW_CLS_REQUESTTRAINING_GENERAL] WHERE PID_REQUEST_TRAINING=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_training = dr.Item("NAMA_TRAINING").ToString
                s_str_tanggal = dr.Item("TANGGAL").ToString
                s_str_diajukan = dr.Item("PID_REQUESTOR").ToString
            Else
                s_str_training = "#"
                s_str_tanggal = "#"
                s_str_diajukan = "#"
            End If
        End With
        con.Close()
    End Sub

    Private Sub txt_nrp_TextChanged(sender As Object, e As EventArgs) Handles txt_nrp.TextChanged
        Try
            If txt_nrp.Text <> "" Then
                Dim NRP As String() = Split(txt_nrp.Text, "-")
                txt_nrp.Text = Trim(NRP(0))
                Get_Karyawan(txt_nrp.Text, txt_nama.Text, txt_dept.Text, ddl_company.SelectedValue, ddl_distrik.SelectedValue, txt_jabatan.Text)
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub

    Public Sub Get_Karyawan(ByVal s_str_nrp As String, ByRef s_str_nama As String, ByRef s_str_dept As String, ByRef s_str_company As String, ByRef s_str_distrik As String, ByRef s_str_jabatan As String)
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
            .CommandText = "  SELECT Nama, Departemen, TBL_M_COMPANY.Company, Distrik, Jabatan FROM [vw_AllKaryawan] LEFT OUTER JOIN TBL_M_COMPANY ON TBL_M_COMPANY.Company=[vw_AllKaryawan].Company LEFT OUTER JOIN VW_DISTRIK ON DISTRIK=Lokasi WHERE NRP=@NRP"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_nama = dr.Item("NAMA").ToString
                s_str_dept = dr.Item("DEPARTEMEN").ToString
                s_str_company = dr.Item("COMPANY").ToString
                s_str_distrik = dr.Item("DISTRIK").ToString
                s_str_jabatan = dr.Item("JABATAN").ToString
            Else
                s_str_nama = ""
                s_str_dept = ""
                s_str_company = ""
                s_str_distrik = ""
                s_str_jabatan = ""
            End If
        End With
        con.Close()
    End Sub

    Private Sub btn_addpeserta_Click(sender As Object, e As EventArgs) Handles btn_addpeserta.Click
        Try
            If txt_nrp.Text <> "" And txt_dept.Text <> "" And txt_jabatan.Text <> "" And txt_nama.Text <> "" And ddl_company.SelectedValue <> "" And lbl_idtraining.Text <> "#" Then
                Ins_Peserta(lbl_idtraining.Text, txt_nrp.Text, txt_nama.Text, ddl_company.SelectedValue, ddl_distrik.SelectedValue, txt_dept.Text, txt_jabatan.Text)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Peserta berhasil ditambahkan');", True)
                gv_peserta.DataBind()
                txt_nrp.Text = ""
                txt_dept.Text = ""
                txt_jabatan.Text = ""
                txt_nama.Text = ""
                ddl_company.SelectedValue = ""
                ddl_distrik.SelectedValue = ""
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Data harus terisi lengkap');", True)
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub
    Public Sub Ins_Peserta(ByVal s_str_id As String, ByVal s_str_nrp As String, ByVal s_str_nama As String, ByVal s_str_company As String, ByVal s_str_distrik As String, ByVal s_str_dept As String, ByVal s_str_jabatan As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO [TBL_T_PESERTA_TRAINING]" _
                       & " ([PID_REQUEST_TRAINING],[NRP],[NAMA],[COMPANY],[DISTRIK],[DEPARTEMENT],[JABATAN])" _
                       & " VALUES (@ID,@NRP,@NAMA,@COMPANY,@DISTRIK,@DEPT,@JABATAN)"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            .Parameters.Add("@NAMA", SqlDbType.VarChar, 50).Value = s_str_nama
            .Parameters.Add("@COMPANY", SqlDbType.VarChar, 50).Value = s_str_company
            .Parameters.Add("@DISTRIK", SqlDbType.VarChar, 15).Value = s_str_distrik
            .Parameters.Add("@DEPT", SqlDbType.VarChar, 50).Value = s_str_dept
            .Parameters.Add("@JABATAN", SqlDbType.VarChar, 15).Value = s_str_jabatan
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Del_Peserta(ByVal s_str_id As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE [TBL_T_PESERTA_TRAINING] WHERE PID_PESERTA_TRAINING=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Ins_Kebutuhan(ByVal s_str_id As String, ByVal s_str_akomodasi As String, ByVal s_str_awal As String, ByVal s_str_akhir As String, ByVal s_str_jumlah As String, ByVal s_str_pic As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO [TBL_T_AKOMODASI_TAMBAHAN]" _
                       & " ([PID_REQUEST_TRAINING],[PID_AKOMODASI_TRAINING],[TGL_AWAL],[TGL_AKHIR],[JUMLAH],[PID_USER],[TANGGAL_REQUEST])" _
                       & " VALUES (@ID,@AKOMODASI,@AWAL,@AKHIR,@JUMLAH,@PIC,GETDATE())"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .Parameters.Add("@AKOMODASI", SqlDbType.Int).Value = s_str_akomodasi
            .Parameters.Add("@AWAL", SqlDbType.DateTime).Value = s_str_awal
            .Parameters.Add("@AKHIR", SqlDbType.DateTime).Value = s_str_akhir
            .Parameters.Add("@JUMLAH", SqlDbType.Int).Value = s_str_jumlah
            .Parameters.Add("@PIC", SqlDbType.VarChar, 15).Value = s_str_pic
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Del_Kebutuhan(ByVal s_str_id As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "DELETE [TBL_T_AKOMODASI_TAMBAHAN] WHERE PID_AKOMODASI_TAMBAHAN=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Private Sub btn_addkebutuhan_Click(sender As Object, e As EventArgs) Handles btn_addkebutuhan.Click
        Try
            If ddl_item.SelectedValue <> "" And txt_jumlah.Text <> "" And txt_awal.Text <> "" And txt_akhir.Text <> "" And lbl_idtraining.Text <> "#" Then
                Ins_Kebutuhan(lbl_idtraining.Text, ddl_item.SelectedValue, txt_awal.Text, txt_akhir.Text, txt_jumlah.Text, Session("Nrp"))
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Peserta berhasil ditambahkan');", True)
                gv_kebutuhan.DataBind()
                txt_awal.Text = ""
                txt_akhir.Text = ""
                ddl_item.SelectedValue = ""

            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Data harus terisi lengkap');", True)
            End If

        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try
    End Sub

    Protected Sub gv_peserta_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As String = gv_peserta.DataKeys(e.RowIndex).Value
            If ID <> "" Then
                Del_Peserta(ID)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Peserta berhasil di hapus');", True)
                gv_peserta.DataBind()
            End If

        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub

    Protected Sub gv_kebutuhan_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As String = gv_kebutuhan.DataKeys(e.RowIndex).Value
            If ID <> "" Then
                Del_Kebutuhan(ID)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Akomodasi berhasil di hapus');", True)
                gv_kebutuhan.DataBind()
            End If

        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub
End Class