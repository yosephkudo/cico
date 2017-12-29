Imports System.Data
Imports System.Data.SqlClient
Public Class ClassCuti
    Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_HRGAConn").ConnectionString)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Public Sub Get_DataKaryawan(ByVal str_nrp As String, ByRef str_nama As String, ByRef str_jabatan As String, ByRef str_kawin As String, ByRef str_keluarga As String, ByRef str_penerimaan As String, ByRef str_dinas As String, ByRef str_telepon As String, ByRef str_alamat As String, ByRef str_tahunan As String, ByRef str_besar As String, ByRef str_pengganti As String, ByRef str_remark As String)

        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM VW_KARYAWAN WHERE NRP=@NRP", con)
            With cmd
                .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
                .Parameters("@NRP").Value = str_nrp
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_nama = dr.Item("NAMA").ToString
                str_jabatan = dr.Item("JABATAN").ToString & "/" & dr.Item("DEPT").ToString
                str_kawin = dr.Item("STATUSKELUARGA").ToString
                str_keluarga = dr.Item("STATUSBAWAKELUARGA_DESC").ToString
                str_penerimaan = dr.Item("STATUSPENERIMAAN").ToString
                str_dinas = dr.Item("PERIODEDINAS").ToString
                str_telepon = dr.Item("TELEPON").ToString
                str_alamat = dr.Item("ALAMAT").ToString
                str_tahunan = dr.Item("SISACUTIPERIODE1").ToString
                str_besar = dr.Item("SISACUTIBESAR").ToString
                str_pengganti = dr.Item("PENGGANTIOFF").ToString
                str_remark = "Success"
            Else
                str_remark = "Data Karyawan Tidak ditemukan"
            End If
            con.Close()
        Catch ex As Exception
            str_remark = "Error : Data Karyawan Tidak ditemukan"
        End Try

    End Sub

    Public Sub Get_AkhirCuti(ByVal str_awal As String, ByVal str_perjalanan As String, ByVal str_lapangan As String, ByVal str_tahunan As String, ByVal str_besar As String, ByVal str_pengganti As String, ByRef str_akhir As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM CUFN_CALC_AKHIRCUTI(@AWAL,@PERJALANAN,@LAPANGAN,@TAHUNAN,@BESAR,@PENGGANTI)", con)
            With cmd
                .Parameters.Add("@AWAL", SqlDbType.VarChar, 10)
                .Parameters.Add("@PERJALANAN", SqlDbType.VarChar, 2)
                .Parameters.Add("@LAPANGAN", SqlDbType.VarChar, 2)
                .Parameters.Add("@TAHUNAN", SqlDbType.VarChar, 2)
                .Parameters.Add("@BESAR", SqlDbType.VarChar, 2)
                .Parameters.Add("@PENGGANTI", SqlDbType.VarChar, 2)
                .Parameters("@AWAL").Value = str_awal
                .Parameters("@PERJALANAN").Value = str_perjalanan
                .Parameters("@LAPANGAN").Value = str_lapangan
                .Parameters("@TAHUNAN").Value = str_tahunan
                .Parameters("@BESAR").Value = str_besar
                .Parameters("@PENGGANTI").Value = str_pengganti
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_akhir = dr.Item("TGL").ToString
                str_remark = "Success"
            Else
                str_akhir = str_awal
            End If
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
            str_akhir = str_awal
        End Try

    End Sub

    Public Sub Get_ProposionalCuti(ByVal str_awal As String, ByVal str_nrp As String, ByRef str_hari As String, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM [CUFN_CUTIPROPOSIONAL](@NRP,@AWAL)", con)
            With cmd
                .Parameters.Add("@AWAL", SqlDbType.VarChar, 10)
                .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
                .Parameters("@AWAL").Value = str_awal
                .Parameters("@NRP").Value = str_nrp
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_hari = dr.Item("HARI").ToString
                str_remark = "Success"
            Else
                str_hari = 14
            End If
            con.Close()
        Catch ex As Exception
            str_remark = "Error"
            str_hari = 14
        End Try

    End Sub

    Public Sub Get_DataCuti(ByVal str_nomor As String, ByRef str_nrp As String, ByRef str_perjalanan As DropDownList, ByRef str_lapangan As DropDownList, ByRef str_tahunan As DropDownList, ByRef str_besar As DropDownList, ByRef str_pengganti As DropDownList, ByRef str_total As String, ByRef str_awal As String, ByRef str_akhir As String, ByRef str_tujuan As String, ByRef str_keterangan As String, ByRef str_posisi As String, ByRef str_proposional As String, ByRef str_khusus As DropDownList, ByRef str_remark As String)
        Try
            con.Open()
            cmd = New SqlCommand("SELECT * FROM TBL_T_DETAIL_SURAT WHERE NO_SURAT=@NOMOR", con)
            With cmd
                .Parameters.Add("@NOMOR", SqlDbType.VarChar, 25)
                .Parameters("@NOMOR").Value = str_nomor
            End With
            dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_nrp = dr.Item("NRP").ToString
                str_total = dr.Item("TOTAL").ToString
                str_awal = Format(CDate(dr.Item("AWAL").ToString), "yyyy/MM/dd")
                str_akhir = Format(CDate(dr.Item("AKHIR").ToString), "yyyy/MM/dd")
                str_tujuan = dr.Item("TUJUAN").ToString
                str_keterangan = dr.Item("KETERANGAN").ToString
                str_posisi = dr.Item("POSISI_APPROVAL").ToString
                Get_ProposionalCuti(str_awal, str_nrp, str_proposional, str_remark)
                str_perjalanan.DataBind()
                str_lapangan.DataBind()
                str_tahunan.DataBind()
                str_besar.DataBind()
                str_pengganti.DataBind()
                str_perjalanan.SelectedValue = dr.Item("C_PERJALANAN").ToString
                str_lapangan.SelectedValue = dr.Item("C_LAPANGAN").ToString
                str_tahunan.SelectedValue = dr.Item("C_TAHUNAN").ToString
                str_besar.SelectedValue = dr.Item("C_BESAR").ToString
                str_pengganti.SelectedValue = dr.Item("C_PENGGANTI").ToString
                str_khusus.SelectedValue = dr.Item("KODE_CUTI").ToString
                str_remark = "Success"
            Else
                str_remark = "Data tidak ditemukan"
            End If
            con.Close()
        Catch ex As Exception
            str_remark = "Error"

        End Try

    End Sub

    Public Sub Cek_Nomor(ByVal str_nomor As String, ByVal str_profile As String, ByVal str_dept As String, ByRef str_remark As String)
        Try
        con.Open()
        cmd = New SqlCommand("SELECT [NO_SURAT] FROM [DB_HRGA].[dbo].[VW_LIST_SURAT] WHERE NO_SURAT=@NOMOR AND DEPT=CASE WHEN @PROFILE IN (3,4,5,6,7,8,9,11) THEN DEPT ELSE @DEPT END", con)
        With cmd
            .Parameters.Add("@NOMOR", SqlDbType.VarChar, 25)
            .Parameters.Add("@PROFILE", SqlDbType.Int)
            .Parameters.Add("@DEPT", SqlDbType.VarChar, 10)
            .Parameters("@NOMOR").Value = str_nomor
            .Parameters("@PROFILE").Value = str_profile
            .Parameters("@DEPT").Value = str_dept
        End With
        dr = cmd.ExecuteReader()
            If dr.Read = True Then
                str_remark = "Success"
            Else
                str_remark = "No Access"
            End If
        Catch ex As Exception
            str_remark = "Error"
        End Try
        con.Close()
    End Sub
    Public Sub Ins_Cuti(ByVal str_nrp As String, ByVal str_awal As String, ByVal str_akhir As String, ByVal str_lapangan As String, ByVal str_perjalanan As String, ByVal str_tahunan As String, ByVal str_besar As String, ByVal str_pengganti As String, ByVal str_keterangan As String, ByVal str_tujuan As String, ByVal str_user As String, ByRef str_remark As String)
        Try


            con.Open()
            cmd = New SqlCommand("EXEC [SP_INS_CUTI] @NRP,@AWAL,@AKHIR,@LAPANGAN,@PERJALANAN,@TAHUNAN,@BESAR,@PENGGANTI,@KETERANGAN,@TUJUAN,@USER", con)
            With cmd
                .Parameters.Add("@NRP", SqlDbType.VarChar, 15)
                .Parameters.Add("@AWAL", SqlDbType.Date)
                .Parameters.Add("@AKHIR", SqlDbType.Date)
                .Parameters.Add("@LAPANGAN", SqlDbType.Int)
                .Parameters.Add("@PERJALANAN", SqlDbType.Int)
                .Parameters.Add("@TAHUNAN", SqlDbType.Int)
                .Parameters.Add("@BESAR", SqlDbType.Int)
                .Parameters.Add("@PENGGANTI", SqlDbType.Int)
                .Parameters.Add("@KETERANGAN", SqlDbType.VarChar, 500)
                .Parameters.Add("@TUJUAN", SqlDbType.VarChar, 500)
                .Parameters.Add("@USER", SqlDbType.VarChar, 15)

                .Parameters("@NRP").Value = str_nrp
                .Parameters("@AWAL").Value = str_awal
                .Parameters("@AKHIR").Value = str_akhir
                .Parameters("@LAPANGAN").Value = str_lapangan
                .Parameters("@PERJALANAN").Value = str_perjalanan
                .Parameters("@TAHUNAN").Value = str_tahunan
                .Parameters("@BESAR").Value = str_besar
                .Parameters("@PENGGANTI").Value = str_pengganti
                .Parameters("@KETERANGAN").Value = str_keterangan
                .Parameters("@TUJUAN").Value = str_tujuan
                .Parameters("@USER").Value = str_user
                .ExecuteNonQuery()
            End With
            str_remark = "Success"
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub
    Public Sub Approve_Cuti(ByVal str_status As String, ByVal str_nomor As String, ByVal str_posisi As String, ByVal str_user As String, ByVal str_keterangan As String, ByVal str_awal As String, ByVal str_akhir As String, ByVal str_lapangan As String, ByVal str_perjalanan As String, ByVal str_tahunan As String, ByVal str_besar As String, ByVal str_pengganti As String, ByVal str_kode As String, ByRef str_remark As String)
        Try


            con.Open()
            cmd = New SqlCommand("EXEC [SP_APPROVE_CUTI] @STATUS_APPROVE,@NOMOR,@POSISI,@APPROVEBY,@KETERANGAN,@AWAL,@AKHIR,@LAPANGAN,@PERJALANAN,@TAHUNAN,@BESAR,@PENGGANTI,@KODE_CUTI", con)
            With cmd
                .Parameters.Add("@STATUS_APPROVE", SqlDbType.Int)
                .Parameters.Add("@NOMOR", SqlDbType.VarChar, 25)
                .Parameters.Add("@POSISI", SqlDbType.Int)
                .Parameters.Add("@APPROVEBY", SqlDbType.VarChar, 15)
                .Parameters.Add("@KETERANGAN", SqlDbType.VarChar, 500)
                .Parameters.Add("@AWAL", SqlDbType.Date)
                .Parameters.Add("@AKHIR", SqlDbType.Date)
                .Parameters.Add("@LAPANGAN", SqlDbType.Int)
                .Parameters.Add("@PERJALANAN", SqlDbType.Int)
                .Parameters.Add("@TAHUNAN", SqlDbType.Int)
                .Parameters.Add("@BESAR", SqlDbType.Int)
                .Parameters.Add("@PENGGANTI", SqlDbType.Int)
                .Parameters.Add("@KODE_CUTI", SqlDbType.VarChar, 2)

                .Parameters("@STATUS_APPROVE").Value = str_status
                .Parameters("@NOMOR").Value = str_nomor
                .Parameters("@POSISI").Value = str_posisi
                .Parameters("@APPROVEBY").Value = str_user
                .Parameters("@KETERANGAN").Value = str_keterangan
                .Parameters("@AWAL").Value = str_awal
                .Parameters("@AKHIR").Value = str_akhir
                .Parameters("@LAPANGAN").Value = str_lapangan
                .Parameters("@PERJALANAN").Value = str_perjalanan
                .Parameters("@TAHUNAN").Value = str_tahunan
                .Parameters("@BESAR").Value = str_besar
                .Parameters("@PENGGANTI").Value = str_pengganti
                .Parameters("@KODE_CUTI").Value = str_kode

                .ExecuteNonQuery()
            End With
            str_remark = "Success"
        Catch ex As Exception
            str_remark = "Error"
        End Try
    End Sub

End Class



