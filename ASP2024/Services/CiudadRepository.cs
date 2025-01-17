using ASP2024.Models;
using Dapper;
using FirebirdSql.Data.FirebirdClient;

public interface ICiudadRepository{
    public Task<IEnumerable<Ciudad>>listarCiudades();
    public Task<int> idLastCiudad();
    public Task InsertarCiudad(Ciudad ciudad);
}

public class CiudadRepository: ICiudadRepository{
    public readonly string connectionString;
    public CiudadRepository(IConfiguration configuration){
    this.connectionString = configuration.GetConnectionString("DefaultConnection");
    }

    public async Task<IEnumerable<Ciudad>> listarCiudades(){
    using var connection = new FbConnection(connectionString);
    return await connection.QueryAsync<Ciudad>(@"SELECT * FROM CIUDAD;");}

    public async Task InsertarCiudad(Ciudad ciudad){
    using var connection = new FbConnection(connectionString);
    int? ultimoID = await idLastCiudad();
    ultimoID+=1;
    var sql = "INSERT INTO CIUDAD(IDCIUDAD,CIUDAD,TASA_AEROPUERTO) VALUES (" + ultimoID + ",'" + ciudad.ciudad + "','" + ciudad.tasa_aeropuerto + ")";
    Console.WriteLine(sql); 
    await connection.ExecuteAsync(sql);
    }

    public async Task<int> idLastCiudad(){
    int ultimo=0;
    using var connection = new FbConnection(connectionString);
    ultimo = await connection.QueryFirstAsync<int>(@"SELECT MAX(IDCIUDAD) AS ID FROM CIUDAD");
    return ultimo;
    }
}