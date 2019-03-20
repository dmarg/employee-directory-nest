import { Module } from '@nestjs/common';
import { EmployeesResolver } from './employees.resolver';
import { EmployeesService } from './employees.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from './employees.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Employee])],
  providers: [EmployeesResolver, EmployeesService, ],
})
export class EmployeesModule {}
