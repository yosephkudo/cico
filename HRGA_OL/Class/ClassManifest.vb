Imports System.Data
Imports System.Data.SqlClient
Public Class ClassManifest
    Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_HRGAConn").ConnectionString)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader

    Public Sub Get_Surat(ByVal str_nomor As String, ByRef str_nrp As String, ByRef str_nama As String, ByRef str_jabatan As String, ByRef str_dept As String, ByRef str_penerimaan As String, ByRef str_keperluan As String, ByRef str_awal As String, ByRef str_akhir As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM VW_LIST_SURAT WHERE NO_SURAT=@NOMOR AND POSISI_APPROVAL<>0", con)
            With cmd
                .Parameters.Add("@NOMOR", SqlDbType.VarChar, 50)
                .Parameters("@NOMOR").Value = str_nomor
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_nrp = dr.Item("NRP").ToString
                str_nama = dr.Item("NAMA").ToString
                str_jabatan = dr.Item("JABATAN").ToString
                str_dept = dr.Item("DEPT").ToString
                str_penerimaan = dr.Item("STATUSPENERIMAAN").ToString
                str_keperluan = dr.Item("DETAIL_KEPERLUAN").ToString
                str_awal = dr.Item("AWAL").ToString
                str_akhir = dr.Item("AKHIR").ToString
                str_remark = "Success"
            Else
                str_remark = "Data Tidak ditemukan"
            End If
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub

    Public Sub Get_SisaKuota(ByVal str_dari As String, ByVal str_tujuan As String, ByVal str_tanggal As String, ByRef str_kuota As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM [CUFN_GET_SISAKUOTA_MANIFEST](@DARI,@TUJUAN,@TANGGAL)", con)
            With cmd
                .Parameters.Add("@DARI", SqlDbType.VarChar, 50)
                .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 50)
                .Parameters.Add("@TANGGAL", SqlDbType.Date)
                .Parameters("@DARI").Value = str_dari
                .Parameters("@TUJUAN").Value = str_tujuan
                .Parameters("@TANGGAL").Value = str_tanggal
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_kuota = dr.Item("SISA").ToString
                str_remark = "Success"
            Else
                str_kuota = 0
                str_remark = "Data Tidak ditemukan"
            End If
            con.Close()
        Catch ex As Exception
            str_kuota = 0
            str_remark = "Error"
        End Try
    End Sub


    Public Sub Ins_Sarana(ByVal str_nomor As String, ByVal str_dari As String, ByVal str_tujuan As String, ByVal str_tanggal As String, ByVal str_user As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("INSERT INTO [TBL_T_REQ_MANIFEST_SARANA] (NO_SURAT, ID_RUTE, TANGGAL_BERANGKAT,CREATEBY, CREATEDATE)" & _
                                " VALUES (@NOMOR, (SELECT ID_RUTE FROM TBL_M_RUTE_SARANA WHERE DARI=@DARI AND TUJUAN =@TUJUAN), @TANGGAL, @USER, GETDATE())", con)
            With cmd
                .Parameters.Add("@NOMOR", SqlDbType.VarChar, 50)
                .Parameters.Add("@DARI", SqlDbType.VarChar, 50)
                .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 50)
                .Parameters.Add("@TANGGAL", SqlDbType.Date)
                .Parameters.Add("@USER", SqlDbType.VarChar, 15)

                .Parameters("@NOMOR").Value = str_nomor
                .Parameters("@DARI").Value = str_dari
                .Parameters("@TUJUAN").Value = str_tujuan
                .Parameters("@TANGGAL").Value = str_tanggal
                .Parameters("@USER").Value = str_user
                .ExecuteNonQuery()
            End With
            str_remark = "Success"
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub


    Public Sub Upd_Sarana(ByVal str_nrp As String, ByVal str_keterangan As String, ByVal str_nomor As String, ByVal str_id As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("UPDATE [TBL_T_REQ_MANIFEST_SARANA] SET NRP_KELUARGA=@NRP, KETERANGAN=@KETERANGAN, POSISI_APPROVAL=(SELECT POSISI_APPROVAL FROM TBL_T_DETAIL_SURAT WHERE NO_SURAT=@NOMOR) WHERE ID_REQ_SARANA=@ID", con)
            With cmd
                .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
                .Parameters.Add("@KETERANGAN", SqlDbType.VarChar, 50)
                .Parameters.Add("@NOMOR", SqlDbType.VarChar, 50)
                .Parameters.Add("@ID", SqlDbType.Int)

                .Parameters("@NRP").Value = str_nrp
                .Parameters("@KETERANGAN").Value = str_keterangan
                .Parameters("@NOMOR").Value = str_nomor
                .Parameters("@ID").Value = str_id
                .ExecuteNonQuery()
            End With
            str_remark = "Success"
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub

    Public Sub Del_Sarana(ByVal str_id As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("UPDATE [TBL_T_REQ_MANIFEST_SARANA] SET NRP_KELUARGA=NULL, KETERANGAN=NULL, POSISI_APPROVAL=0 WHERE ID_REQ_SARANA=@ID", con)
            With cmd
                .Parameters.Add("@ID", SqlDbType.VarChar, 50)
                .Parameters("@ID").Value = str_id
                .ExecuteNonQuery()
            End With
            str_remark = "Success"
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub

End Class
