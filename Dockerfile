FROM microsoft/dotnet:latest

RUN git clone https://github.com/exampleuser1234/RestApi.git app

WORKDIR /app/GithubServices

#Replacing github token(token can't be stored in repository)
RUN sed -i -- 's/<OAUTHTOKEN>/<TOKEN>/g' Environment.cs

WORKDIR ../
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
ENTRYPOINT ["dotnet", "DeluxeRestApp/bin/Debug/netcoreapp2.0/DeluxeRestApp.dll"]

EXPOSE 5000
