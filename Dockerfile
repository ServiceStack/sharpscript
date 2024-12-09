FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY . .
RUN dotnet restore ./src/

WORKDIR /source/src
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
LABEL service="sharpscript"

WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "SharpScript.dll"]