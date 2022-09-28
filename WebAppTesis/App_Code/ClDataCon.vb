Imports System.Data
Imports System.Data.Common
Imports MySql.Data.MySqlClient

Public Class ClDataCon
    Public DbConnection As DbConnection

    Public DbComando As DbCommand
    Public MyDbDataAdapter As DbDataAdapter
    Public MyDbParameter As DbParameter
    Public MyDbParameterCollection As DbParameterCollection

    Public Conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Public LwsMensajeError As String = ""

    Public Sub New()
        If IsNothing(DbConnection) Then
            DbConnection = New MySqlConnection(Conexionbase)
            MyDbDataAdapter = New MySqlDataAdapter
            MyDbParameter = New MySqlParameter

            DbComando = DbConnection.CreateCommand
            DbComando.Connection = DbConnection
        End If
    End Sub


    Function ConsultaDB(ByVal SqlQuery As String, ByRef DataSetVista As Data.DataSet) As Boolean
        ConsultaDB = False

        Dim DtVista As New DataSet("Vista")

        Try
            Dim Dbadater As DbDataAdapter
            If IsNothing(DbConnection) Then
                DbConnection = New MySqlConnection(Conexionbase)
            End If
            If DbConnection.State = ConnectionState.Closed Then
                DbConnection.Open()
            End If

            Dbadater = New MySqlDataAdapter With {
                .SelectCommand = New MySqlCommand(SqlQuery, DbConnection)
            }
            Dbadater.Fill(DtVista)
            Dbadater.Dispose()
            Dbadater = Nothing

            ConsultaDB = True

            DataSetVista = DtVista

            DtVista = Nothing

        Catch ex As Exception
            ConsultaDB = False
            LwsMensajeError = ex.Message & " " & Conexionbase
            Exit Function
        Finally
            DbConnection.Close()
            Libera_Conexion()
        End Try

    End Function

    Sub Libera_Conexion()
        MySqlConnection.ClearAllPools()
        MySqlConnection.ClearPool(DbConnection)

    End Sub
    Sub LiberaTodasConexion()
        MySqlConnection.ClearAllPools()
    End Sub

    Function Eje_Sentenci_Mysql(ByVal SqlQuery As String) As String

        Dim DbComando As DbCommand
        Dim DtrReader As DbDataReader

        DtrReader = Nothing
        Eje_Sentenci_Mysql = ""

        Try
            If IsNothing(DbConnection) Then
                DbConnection = New MySqlConnection(Conexionbase)
            End If
            If DbConnection.State = ConnectionState.Closed Then
                DbConnection.Open()
            End If

            DbComando = DbConnection.CreateCommand
            DbComando.CommandText = SqlQuery

            DbComando.ExecuteReader()
            DbComando.Connection.Close()
            Eje_Sentenci_Mysql = ""
        Catch ex As Exception
            Eje_Sentenci_Mysql = ex.Message
        Finally
            DbConnection.Close()
        End Try

    End Function

    Function FuncDatos_Verificar(ByVal SqlQuery As String) As Boolean
        Dim DbDataReader As DbDataReader
        Dim DataSet As New DataSet

        DbDataReader = Nothing

        FuncDatos_Verificar = False

        Call Me.ConsultaDB(SqlQuery, DataSet)

        Dim DtableConsul As Data.DataTable
        DtableConsul = DataSet.Tables(0)
        Dim currentRows() As DataRow = DtableConsul.Select(Nothing, Nothing, DataViewRowState.CurrentRows)

        If currentRows.Length > 0 Then
            FuncDatos_Verificar = True
        Else
            FuncDatos_Verificar = False
        End If
    End Function

End Class
