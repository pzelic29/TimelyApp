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

  editProject(start: Date, stop: Date, id:number) {
    var p: Project = {
      projectName: "aaaaaaaaaaaaa",
      projectDuration: "1",
      projectStart: new Date(start),
      projectStop: new Date(stop),
      projectId: id
    }
    var url = `${this.getUrl}/${p.projectId}`;
    return this.http.put<Project>(url, p);
  }
}