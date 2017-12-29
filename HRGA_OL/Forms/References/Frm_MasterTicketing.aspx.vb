Public Class Frm_MasterTicketing
    Inherits System.Web.UI.Page
    Dim HariPenerbangan As String
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
    Public Sub Ins_Penerbangan(ByVal s_str_dari As String, ByVal s_str_tujuan As String, ByVal s_str_maskapai As String, ByVal s_str_berangkat As String, ByVal s_str_tiba As String, ByVal s_str_flight As String, ByVal s_int_maskapaicode As String, ByVal s_str_hari As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO TBLPENERBANGAN (DARI, TUJUAN, MASKAPAI, BERANGKAT, TIBA, FLIGHT, MASKAPAICODE, HARIPENERBANGAN) VALUES (UPPER(@DARI), UPPER(@TUJUAN), @MASKAPAI, @BERANGKAT, @TIBA, @FLIGHT, @MASKAPAICODE, @HARI)"
            .Parameters.Add("@DARI", SqlDbType.VarChar, 20).Value = s_str_dari
            .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 20).Value = s_str_tujuan
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 20).Value = s_str_maskapai
            .Parameters.Add("@BERANGKAT", SqlDbType.VarChar, 5).Value = Left(s_str_berangkat, 2) & ":" & Right(s_str_berangkat, 2)
            .Parameters.Add("@TIBA", SqlDbType.VarChar, 5).Value = Left(s_str_tiba, 2) & ":" & Right(s_str_tiba, 2)
            .Parameters.Add("@FLIGHT", SqlDbType.VarChar, 10).Value = s_str_flight
            .Parameters.Add("@MASKAPAICODE", SqlDbType.VarChar, 5).Value = s_int_maskapaicode
            .Parameters.Add("@HARI", SqlDbType.VarChar, 500).Value = s_str_hari
            .ExecuteNonQuery()
        End With
        con.Close()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
    End Sub
    Public Sub Upd_Penerbangan(ByVal s_str_dari As String, ByVal s_str_tujuan As String, ByVal s_str_maskapai As String, ByVal s_str_berangkat As String, ByVal s_str_tiba As String, ByVal s_str_flight As String, ByVal s_int_maskapaicode As String, ByRef s_str_hari As String, ByVal s_int_id As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE TBLPENERBANGAN SET DARI=UPPER(@DARI), TUJUAN=UPPER(@TUJUAN), MASKAPAI=@MASKAPAI, BERANGKAT=@BERANGKAT, TIBA=@TIBA, FLIGHT=@FLIGHT, MASKAPAICODE=@MASKAPAICODE, HARIPENERBANGAN=@HARI WHERE IDPENERBANGAN=@ID"
            .Parameters.Add("@DARI", SqlDbType.VarChar, 20).Value = s_str_dari
            .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 20).Value = s_str_tujuan
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 20).Value = s_str_maskapai
            .Parameters.Add("@BERANGKAT", SqlDbType.VarChar, 5).Value = Left(s_str_berangkat, 2) & ":" & Right(s_str_berangkat, 2)
            .Parameters.Add("@TIBA", SqlDbType.VarChar, 5).Value = Left(s_str_tiba, 2) & ":" & Right(s_str_tiba, 2)
            .Parameters.Add("@FLIGHT", SqlDbType.VarChar, 10).Value = s_str_flight
            .Parameters.Add("@MASKAPAICODE", SqlDbType.VarChar, 5).Value = s_int_maskapaicode
            .Parameters.Add("@HARI", SqlDbType.VarChar, 500).Value = s_str_hari
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .ExecuteNonQuery()
        End With
        con.Close()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
    End Sub

    Public Sub Ins_Kelas(ByVal s_str_maskapai As String, ByVal s_str_kelas As String, ByVal s_str_desc As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO tblTravelAuthorization_Flight_Class (AIRLINECODE, KELAS, [DESC], [STATUS]) VALUES (@MASKAPAI, @KELAS, @DESC, 1)"
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 10).Value = s_str_maskapai
            .Parameters.Add("@KELAS", SqlDbType.VarChar, 10).Value = s_str_kelas
            .Parameters.Add("@DESC", SqlDbType.VarChar, 20).Value = s_str_desc
            .ExecuteNonQuery()
        End With
        con.Close()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
    End Sub

    Public Sub Del_Penerbangan(ByVal s_str_id As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "Delete TblPenerbangan Where IdPenerbangan=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Dihapus');", True)
    End Sub

    Public Sub Get_Hari()
        HariPenerbangan = ""
        For Each Hari As ListItem In cb_hari.Items
            If Hari.Selected = True Then
                If HariPenerbangan = "" Then
                    HariPenerbangan = Hari.Value
                Else
                    HariPenerbangan = HariPenerbangan & ";" & Hari.Value
                End If
            End If
        Next
    End Sub

    Public Sub Load_Hari()
        If HariPenerbangan <> "" Then
            Dim Hari() As String = Split(HariPenerbangan, ";")
            Dim arr As Array = Hari
            For Jml As Integer = 1 To arr.Length
                Dim CkHari As String = Trim(Hari(Jml - 1))
                For Each HariItem As ListItem In cb_hari.Items
                    If HariItem.Value = CkHari Then
                        HariItem.Selected = True
                    End If
                Next
            Next
        Else
            For Each HariItem As ListItem In cb_hari.Items
                HariItem.Selected = False
            Next
        End If
       
    End Sub
    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            If txt_dari.Text <> "" And txt_tujuan.Text <> "" And txt_flight.Text <> "" And txt_jamberangkat.Text <> "" And txt_jamtiba.Text <> "" And lbl_id.Text = "" Then
                Dim status As Integer = 0
                Cek_Penerbangan(txt_dari.Text, txt_tujuan.Text, txt_jamberangkat.Text, ddl_maskapai.SelectedItem.Text, status)
                If status = 1 Then
                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Jadwal Penerbangan sudah tersedia');", True)
                Else
                    Get_Hari()
                    Ins_Penerbangan(txt_dari.Text, txt_tujuan.Text, ddl_maskapai.SelectedItem.Text, txt_jamberangkat.Text, txt_jamtiba.Text, txt_flight.Text, ddl_maskapai.SelectedValue, HariPenerbangan)
                End If
            ElseIf txt_dari.Text <> "" And txt_tujuan.Text <> "" And txt_flight.Text <> "" And txt_jamberangkat.Text <> "" And txt_jamtiba.Text <> "" And lbl_id.Text <> "" Then
                Get_Hari()
                Upd_Penerbangan(txt_dari.Text, txt_tujuan.Text, ddl_maskapai.SelectedItem.Text, txt_jamberangkat.Text, txt_jamtiba.Text, txt_flight.Text, ddl_maskapai.SelectedValue, HariPenerbangan, lbl_id.Text)

            End If
            txt_dari.Text = ""
            txt_tujuan.Text = ""
            txt_flight.Text = ""
            txt_jamberangkat.Text = ""
            txt_jamtiba.Text = ""
            lbl_id.Text = ""
            gv_penerbangan.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
       
    End Sub

    Private Sub btn_submitkelas_Click(sender As Object, e As EventArgs) Handles btn_submitkelas.Click
        Try
            If txt_kelas.Text <> "" And txt_kelasdesc.Text <> "" Then
                Ins_Kelas(ddl_airline.SelectedValue, txt_kelas.Text, txt_kelasdesc.Text)
                txt_kelas.Text = ""
                txt_kelasdesc.Text = ""
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try
       
    End Sub
    Public Sub Cek_Penerbangan(ByVal s_str_dari As String, ByVal s_str_tujuan As String, ByVal s_str_jam As String, ByVal s_str_maskapai As String, ByRef s_str_status As Integer)
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
            .CommandText = "SELECT COUNT(*) Jml FROM TBLPENERBANGAN WHERE DARI=@DARI AND TUJUAN=@TUJUAN AND BERANGKAT=@JAM AND MASKAPAI=@MASKAPAI"
            .Parameters.Add("@DARI", SqlDbType.VarChar, 50).Value = s_str_dari
            .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 50).Value = s_str_tujuan
            .Parameters.Add("@JAM", SqlDbType.VarChar, 5).Value = s_str_jam
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 50).Value = s_str_maskapai
            dr = .ExecuteReader
            If dr.Read = True Then
                If dr.Item("Jml").ToString = "0" Then
                    s_str_status = 0
                Else
                    s_str_status = 1
                End If

            Else
                s_str_status = 0
            End If
            con.Close()
        End With
    End Sub

    Public Sub Get_Penerbangan(ByRef s_str_dari As String, ByRef s_str_tujuan As String, ByRef s_str_jam As String, ByRef s_str_tiba As String, ByRef s_str_maskapai As String, ByRef s_str_flight As String, ByRef s_str_hari As String, ByRef s_str_id As Integer)
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
            .CommandText = "SELECT DARI, TUJUAN, MASKAPAICODE, BERANGKAT, TIBA, FLIGHT, HARIPENERBANGAN FROM TBLPENERBANGAN WHERE IDPENERBANGAN=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_dari = dr.Item("DARI").ToString
                s_str_tujuan = dr.Item("TUJUAN").ToString
                s_str_maskapai = dr.Item("MASKAPAICODE").ToString
                s_str_jam = dr.Item("BERANGKAT").ToString
                s_str_tiba = dr.Item("TIBA").ToString
                s_str_flight = dr.Item("FLIGHT").ToString
                s_str_hari = dr.Item("HARIPENERBANGAN").ToString
            Else


            End If
            con.Close()
        End With
    End Sub

    Protected Sub gv_penerbangan_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As Integer = gv_penerbangan.DataKeys(e.RowIndex).Value
            Del_Penerbangan(ID)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try


    End Sub

    Protected Sub gv_penerbangan_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            lbl_id.Text = gv_penerbangan.DataKeys(e.NewSelectedIndex).Value
            Get_Penerbangan(txt_dari.Text, txt_tujuan.Text, txt_jamberangkat.Text, txt_jamtiba.Text, ddl_maskapai.SelectedValue, txt_flight.Text, HariPenerbangan, lbl_id.Text)
            Load_Hari()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
        End Try

    End Sub
End Class