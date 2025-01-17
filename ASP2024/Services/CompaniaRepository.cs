using ASP2024.Models;
using Dapper;
using FirebirdSql.Data.FirebirdClient;

public interface ICompaniaRepository{
    public Task InsertarCompania(Compania compania);
}

public class CompaniaRepository: ICompaniaRepository{
    public readonly string connectionString;
    public CompaniaRepository(IConfiguration configuration){
    this.connectionString = configuration.GetConnectionString("DefaultConnection");
    }

    public async Task InsertarCompania(Compania compania){
    using var connection = new FbConnection(connectionString);
    int? ultimoID = await connection.QueryFirstAsync<int>(@"SELECT MAX(IDCOMPANIA) AS ID FROM COMPANIA");
    ultimoID+=1;
    var sql = "INSERT INTO COMPANIA(IDCOMPANIA, COMPANIA) VALUES (" + ultimoID + ",'" + compania.nombre + "')";
    Console.WriteLine(sql); 
    await connection.ExecuteAsync(sql);
    }

}

