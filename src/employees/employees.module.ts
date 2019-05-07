import { DepartmentsModule } from './../departments/departments.module';
import { PositionsModule } from 'src/positions/positions.module';
import { Module, forwardRef } from '@nestjs/common';
import { EmployeesResolver } from './employees.resolver';
import { EmployeesService } from './employees.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from './employees.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Employee]), forwardRef(() => PositionsModule), forwardRef(() => DepartmentsModule)],
  providers: [EmployeesResolver, EmployeesService],
  exports: [EmployeesService]
})
export class EmployeesModule {}
