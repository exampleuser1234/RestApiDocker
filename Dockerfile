FROM microsoft/dotnet:latest

RUN git clone https://github.com/exampleuser1234/RestApi.git app

WORKDIR /app/GithubServices

#Replacing github token(token can't be stored in repository)
RUN sed -i -- 's/<OAUTHTOKEN>/5df82fb1d2a9cbd0a98e2b25a0f1de274d69185d/g' Environment.cs

WORKDIR ../
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
ENTRYPOINT ["dotnet", "DeluxeRestApp/bin/Debug/netcoreapp2.0/DeluxeRestApp.dll"]

EXPOSE 5000
