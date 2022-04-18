import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Subscription } from 'rxjs';
import { Project } from '../Models/Project';
import { ProjectService } from '../service/project.service';
import { DialogComponent } from '../dialog/dialog.component';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-project',
  templateUrl: './project.component.html',
  styleUrls: ['./project.component.css']
})
export class ProjectComponent implements OnInit {

  projects: Project[] = [];
  fileName= 'Projects.xlsx';
  clicked: boolean = false;
  projectName: string='';
  subscription: Subscription = new Subscription;
  projectForSave!: Project;
  projectStart!: Date;
  projectStop!: Date;
  projectDuration: String='';

  constructor(private projectService: ProjectService, public dialog: MatDialog) { }

  

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogComponent, {
      width: '250px',
      data: {projectName: this.projectName},
    });

    dialogRef.afterClosed().subscribe(result => {
      
      if(result){

        this.projectStart = new Date()
        this.projects.pop();
        
        //let diffMs = this.projectStop.getTime() - this.projectStart.getTime(); // milliseconds
        let diffMs = (new Date().getTime()) - this.projectStart.getTime(); // milliseconds
        let diffDays = Math.floor(diffMs / 86400000); // days
        let diffHrs = Math.floor((diffMs % 86400000) / 3600000); // hours
        let diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000); // minutes
        let diffSeconds =  Math.round((((diffMs % 86400000) % 3600000) % 60000) / 1000);

        this.projectForSave = {
          projectName: result,
          projectStart: this.projectStart,
          projectStop: this.projectStop,
          projectDuration: diffDays + " days, " + diffHrs + " hours, " + diffMins + " minutes, " + diffSeconds + " seconds"
        };
        
        this.projectService.addProject(this.projectForSave).subscribe((projectForSave) => (this.projects.push(projectForSave)));
        this.clicked = !this.clicked;
      }
    });
  }

  onStartStop(){
    if(!this.clicked){
      this.projectStart = new Date()
      this.projectForSave = {
        projectName: "...",
        projectStart: new Date(),
        projectStop: null,
        projectDuration:"..."
      };
      this.projects.push(this.projectForSave);
      console.log(this.projectForSave)

      
      this.clicked = !this.clicked;
    }else{

      this.openDialog();
      
    }
  }
  onDelete(project:any) {
    this.projectService
      .deleteProject(project)
      .subscribe(
        () => (this.projects = this.projects.filter((p) => p.projectId !== project.projectId))
      );
  }

  onEdit(start: Date, stop:Date, id: number) {
    this.projectService
      .editProject(start, stop, id)

      location.reload()
      
  }

  ngOnInit(): void {
    this.projectService.getProjects().subscribe((data: Project[]) => {
      this.projects = data;
    });
  }

  ExportToExcel(){
    let element = document.getElementById('excel-table');
    console.log(element);
    const ws: XLSX.WorkSheet =XLSX.utils.table_to_sheet(element);
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
    XLSX.writeFile(wb, this.fileName);

  }

  dohvacanje(project: Project){
    var p = project.projectId

    if(p == null){
      p = 0
    }
    console.log("ID:" ,p)
    var inputValue1 = (<HTMLInputElement>document.getElementById("editStartId")).value;
    var inputValue2 = (<HTMLInputElement>document.getElementById("editStopId")).value;
    var mydate = new Date(inputValue1);
    var mydate2 = new Date(inputValue2)
    this.onEdit(mydate,mydate2,p);



  }

}