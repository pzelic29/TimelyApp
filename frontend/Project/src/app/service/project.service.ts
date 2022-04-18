import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Project } from '../Models/Project';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
  }),
};

@Injectable({
  providedIn: 'root'
})
export class ProjectService {

  readonly getUrl = "https://localhost:44374/api/Projects";
  

  constructor(private http: HttpClient) { }

  getProjects(): Observable<Project[]>{
    return this.http.get<Project[]>(`${this.getUrl}`);
  }

  addProject(project: Project): Observable<Project> {
    return this.http.post<Project>(this.getUrl, project, httpOptions);
  }

  deleteProject(project: Project): Observable<Project> {
    const url = `${this.getUrl}/${project.projectId}`;
    console.log("brisanje ",url)
    return this.http.delete<Project>(url);
  }

  editProject( id:number,name:string,start: Date, stop: Date) {
    var p: Project = {
      projectId: id,
      projectName: name,
      projectStart: new Date(start),
      projectStop: new Date(stop),
      projectDuration: "",
      
    }

    console.log("project: ",p)
    
    var url = `${this.getUrl}/${p.projectId}`;
    console.log("putanja: ",url)
    var res = this.http.put<Project>(url, p,httpOptions);
    console.log(res)
    return res;
  }
}