Imports System.Data.SqlClient

Public Class Frm_AssignTA
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
    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            If gv_listTA.Rows.Count > 0 Then
                If ddl_TA.SelectedValue <> "" Then
                    If ddl_agent.SelectedValue = 0 Then
                        Assign_All()
                    Else
                        Ins_Assign(ddl_TA.SelectedValue, ddl_agent.SelectedValue, Session("Nrp"))
                    End If
                    Alert_Assign(ddl_TA.SelectedValue, ddl_agent.SelectedValue)
                   
                End If
            End If
           

            If gv_emergency.Rows.Count > 0 Then
                For Each Row As GridViewRow In gv_emergency.Rows
                    If Row.RowType = DataControlRowType.DataRow Then
                        Dim ID As Integer = gv_emergency.DataKeys(Row.RowIndex).Value.ToString
                        Assign_Emergency(ID, ddl_agent_emergency.SelectedValue, Session("Nrp"))
                    End If
                Next
                Alert_AssignEmergency(ddl_TA.SelectedValue, ddl_agent_emergency.SelectedValue)
            End If


            If ddl_TA.SelectedValue <> "" Then
                Assign_GA(ddl_TA.SelectedValue, Session("Nrp"))

            End If
            ddl_distrik.DataBind()
            ddl_TA.DataBind()
            gv_emergency.DataBind()
            gv_listTA.DataBind()
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try
       
    End Sub

    Public Sub Ins_Assign(ByVal s_str_TA As String, ByVal s_str_Supplier As Integer, ByVal s_str_nrp As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO [tblTravelAuthorization_Supplier_Trans]([TravelAuthorizeNo],[KodeSupplier],[AssignBy]) VALUES (@TA,@AGENT,@NRP)"
            .Parameters.Add("@TA", SqlDbType.VarChar, 50).Value = s_str_TA
            .Parameters.Add("@AGENT", SqlDbType.Int).Value = s_str_Supplier
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Assign_Emergency(ByVal s_int_id As Integer, ByVal s_int_agent As Integer, ByVal s_str_nrp As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        Dim ta As String
        ta = ddl_TA.SelectedValue
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.StoredProcedure
            .CommandText = "SP_INS_TICKETORDER_NONTA "
            .Parameters.Add("@ID", SqlDbType.Int)
            .Parameters.Add("@AGENT", SqlDbType.Int)
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
            .Parameters("@ID").Value = s_int_id
            .Parameters("@AGENT").Value = s_int_agent
            .Parameters("@NRP").Value = s_str_nrp
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Alert_Assign(ByVal s_str_TA As String, ByVal s_int_agent As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        Dim ta As String
        ta = ddl_TA.SelectedValue
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.StoredProcedure
            .CommandText = "SP_ALERT_SMS_TA_ASSIGNMENT "
            .Parameters.Add("@NoTA", SqlDbType.VarChar, 50)
            .Parameters.Add("@AGENT", SqlDbType.Int)
            .Parameters("@NoTA").Value = s_str_TA
            .Parameters("@AGENT").Value = s_int_agent
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Alert_AssignEmergency(ByVal s_str_TA As String, ByVal s_int_agent As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        Dim ta As String
        ta = ddl_TA.SelectedValue
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.StoredProcedure
            .CommandText = "SP_ALERT_SMS_NONTA_ASSIGNMENT "
            .Parameters.Add("@NoTA", SqlDbType.VarChar, 50)
            .Parameters.Add("@AGENT", SqlDbType.Int)
            .Parameters("@NoTA").Value = s_str_TA
            .Parameters("@AGENT").Value = s_int_agent
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Assign_All()
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        Dim dr As SqlDataReader
        Dim ta As String
        ta = ddl_TA.SelectedValue
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT [KodeSupplier] FROM [PERSIS].[dbo].[tblTravelAuthorization_Supplier_Reff] where [status]=1"
            dr = .ExecuteReader
            If dr.Read = True Then
                Do
                    Ins_Assign(ddl_TA.SelectedValue, dr.Item("KodeSupplier").ToString, Session("Nrp"))
                Loop While dr.Read
            End If
        End With
        con.Close()
    End Sub

    Public Sub Assign_GA(ByVal s_str_TA As String, ByVal s_str_nrp As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.StoredProcedure
            .CommandText = "SP_INS_TICKETGA"
            .Parameters.Add("@TA", SqlDbType.VarChar, 50)
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
            .Parameters("@TA").Value = s_str_TA
            .Parameters("@NRP").Value = s_str_nrp
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
End Class