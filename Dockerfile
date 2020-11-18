FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY src/*.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY src/. ./
WORKDIR /app
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["dotnet", "SharpScript.dll"]
