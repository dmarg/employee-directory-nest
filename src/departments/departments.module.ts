import { PositionsModule } from 'src/positions/positions.module';
import { Department } from './departments.entity';
import { Module, forwardRef } from '@nestjs/common';
import { DepartmentsService } from './departments.service';
import { DepartmentsResolver } from './departments.resolver';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Department]), forwardRef(() => PositionsModule)],
  providers: [DepartmentsService, DepartmentsResolver],
})
export class DepartmentsModule {}
