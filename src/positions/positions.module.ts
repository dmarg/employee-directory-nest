import { Position } from './positions.entity';
import { Module, forwardRef } from '@nestjs/common';
import { PositionsService } from './positions.service';
import { PositionsResolver } from './positions.resolver';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EmployeesModule } from 'src/employees/employees.module';

@Module({
  imports: [TypeOrmModule.forFeature([Position]), forwardRef(() => EmployeesModule)],
  providers: [PositionsService, PositionsResolver],
  exports: [PositionsService]
})
export class PositionsModule {}
