FROM microsoft/dotnet:2.2-sdk AS build-env
COPY src /app
WORKDIR /app

RUN dotnet restore --configfile NuGet.Config
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["dotnet", "SharpScript.dll"]